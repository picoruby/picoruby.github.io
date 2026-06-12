module AutoIndent
  class << self
    def init
      editor = JS.document.getElementById('editor')

      session = Session.new(editor)
      session.attach
    end
  end

  class Session
    def initialize(editor)
      @editor = editor
    end

    def attach
      @editor.addEventListener('auto-indent') do
        apply_indent
      end

      @editor.addEventListener('auto-outdent') do
        apply_outdent
      end
    end

    private

    def apply_indent
      editor_text = @editor[:value]
      cursor_position = @editor[:selectionStart].to_i

      cursor_line_entry =
        LineExtractor.make_cursor_line_entry(editor_text, cursor_position)

      previous_line_entry =
        LineExtractor.make_previous_line_entry(
          editor_text,
          cursor_line_entry[:start]
        )

      should_increase_indent =
        IndentRuleMatcher.increase_indent?(
          cursor_line_entry,
          previous_line_entry
        )

      next_indent =
        IndentCalculator.make_next_line_indent(
          cursor_line_entry[:text],
          should_increase_indent
        )

      inserted_text = "\n" + next_indent

      # Apply indent
      @editor.setSelectionRange(cursor_position, cursor_position)
      @editor.setRangeText(inserted_text)

      # Move editor cursor position
      new_cursor_position = cursor_position + inserted_text.length
      @editor.setSelectionRange(new_cursor_position, new_cursor_position)

    rescue StandardError
      p 'auto indent error'
    end

    def apply_outdent
      editor_text = @editor[:value]
      cursor_position = @editor[:selectionStart].to_i

      cursor_line_entry =
        LineExtractor.make_cursor_line_entry(editor_text, cursor_position)

      previous_line_entry =
        LineExtractor.make_previous_line_entry(
          editor_text,
          cursor_line_entry[:start]
        )

      return unless IndentRuleMatcher.decrease_indent?(
        cursor_line_entry,
        previous_line_entry
      )

      decreased_indent_line_text =
        IndentCalculator.make_decreased_indent_line_text(
          cursor_line_entry[:text]
        )

      line_start = cursor_line_entry[:start]

      # Apply outdent
      @editor.setSelectionRange(line_start, cursor_position)
      @editor.setRangeText(decreased_indent_line_text)

      # Move editor cursor position
      new_cursor_position = line_start + decreased_indent_line_text.length
      @editor.setSelectionRange(new_cursor_position, new_cursor_position)

    rescue StandardError
      p 'auto outdent error'
    end
  end

  module LineExtractor
    class << self
      def make_cursor_line_entry(editor_text, cursor_position)
        line_start = find_line_start(editor_text, cursor_position)
        line_text = slice_text(editor_text, line_start, cursor_position)

        {
          text: line_text,
          tokens: Tokenizer.tokenize(line_text),
          start: line_start
        }
      end

      def make_previous_line_entry(editor_text, cursor_line_start)
        return nil if cursor_line_start <= 0

        previous_line_end =
          find_previous_line_end(editor_text, cursor_line_start)

        previous_line_start =
          find_line_start(editor_text, previous_line_end)

        previous_line_text =
          slice_text(editor_text, previous_line_start, previous_line_end)

        {
          text: previous_line_text,
          tokens: Tokenizer.tokenize(previous_line_text),
          start: previous_line_start
        }
      end

      private

      def find_line_start(editor_text, position)
        while position > 0 &&
              !newline_char?(char_at(editor_text, position - 1))

          position -= 1
        end

        position
      end

      def find_previous_line_end(editor_text, current_line_start)
        previous_line_end = current_line_start

        if char_at(editor_text, previous_line_end - 1) == "\n"
          previous_line_end -= 1
        end

        if char_at(editor_text, previous_line_end - 1) == "\r"
          previous_line_end -= 1
        end

        previous_line_end
      end

      def char_at(editor_text, index)
        editor_text[index].to_s
      end

      def slice_text(editor_text, start_index, end_index)
        editor_text[start_index...end_index]
      end

      def newline_char?(character)
        ["\n", "\r"].include?(character)
      end
    end
  end

  module IndentRuleMatcher
    INDENT_INCREASE_KEYWORDS = %w[
      begin
      class
      module
      if
      unless
      elsif
      else
      rescue
      ensure
      case
      when
      in
      while
      until
      for
    ]

    INDENT_DECREASE_KEYWORDS = %w[end else elsif rescue ensure when in]

    CLOSING_DELIMITER_TEXTS = ['}', ']', ')']

    CONTINUATION_TEXTS = %w[. , * / % + - = | & ? && || and or]

    class << self
      def increase_indent?(cursor_line_entry, previous_line_entry)
        cursor_line_tokens = cursor_line_entry[:tokens]

        previous_line_tokens =
          previous_line_entry ? previous_line_entry[:tokens] : []

        return true if start_with_indent_keyword?(cursor_line_tokens)
        return true if end_with_block_opener?(cursor_line_tokens)
        return true if end_with_opening_delimiter?(cursor_line_tokens)

        end_with_continuation_token?(cursor_line_tokens) &&
          !end_with_continuation_token?(previous_line_tokens) &&
          !end_with_block_opener?(previous_line_tokens) &&
          !end_with_opening_delimiter?(previous_line_tokens)
      end

      def decrease_indent?(cursor_line_entry, previous_line_entry)
        return false unless single_decrease_indent_token?(
          cursor_line_entry[:tokens]
        )

        cursor_line_indent =
          IndentCalculator.leading_indent(cursor_line_entry[:text])

        return false if cursor_line_indent.length <
                        IndentCalculator::INDENT_UNIT.length

        return true if previous_line_entry.nil?

        previous_line_indent =
          IndentCalculator.leading_indent(previous_line_entry[:text])

        indent_width_delta =
          cursor_line_indent.length - previous_line_indent.length

        # Outdent if the current line is deeper than the previous line.
        # If they are aligned, decide from whether the previous line starts with an indent keyword.
        return true if indent_width_delta > 0
        return false if indent_width_delta < 0

        !start_with_indent_keyword?(previous_line_entry[:tokens])
      end

      private

      def start_with_indent_keyword?(line_tokens)
        # Endless method definitions keep their body on the same line, so they do not increase the next line's indent.
        if keyword_token?(
          first_token_without_space_or_comment(line_tokens),
          ['def']
        ) && !endless_def_line?(line_tokens)

          return true
        end

        keyword_token?(
          first_token_without_space_or_comment(line_tokens),
          INDENT_INCREASE_KEYWORDS
        )
      end

      def single_decrease_indent_token?(line_tokens)
        tokens_without_space_or_comment =
          tokens_without_space_or_comment(line_tokens)

        return false unless tokens_without_space_or_comment.length == 1

        token = tokens_without_space_or_comment.first

        CLOSING_DELIMITER_TEXTS.include?(token[:text]) ||
          keyword_token?(token, INDENT_DECREASE_KEYWORDS)
      end

      def end_with_block_opener?(line_tokens)
        tokens_without_space_or_comment =
          tokens_without_space_or_comment(line_tokens)

        # Ignore trailing block parameters `|...|` and inspect the preceding `do` / `{`.
        if tokens_without_space_or_comment.last &&
           tokens_without_space_or_comment.last[:text] == '|'

          tokens_before_closing_pipe =
            tokens_without_space_or_comment[
              0,
              tokens_without_space_or_comment.length - 1
            ]

          pipe_token_index = tokens_before_closing_pipe.length - 1

          while pipe_token_index >= 0 &&
                tokens_before_closing_pipe[pipe_token_index][:text] != '|'

            pipe_token_index -= 1
          end

          tokens_without_space_or_comment =
            if pipe_token_index >= 0
              tokens_before_closing_pipe[0, pipe_token_index]
            end
        end

        last_token = tokens_without_space_or_comment.last
        return false unless last_token

        last_token[:text] == '{' || keyword_token?(last_token, ['do'])
      end

      def end_with_opening_delimiter?(line_tokens)
        tokens_without_space_or_comment =
          tokens_without_space_or_comment(line_tokens)

        return false if tokens_without_space_or_comment.empty?

        ['(', '['].include?(tokens_without_space_or_comment.last[:text])
      end

      def end_with_continuation_token?(line_tokens)
        tokens_without_space_or_comment =
          tokens_without_space_or_comment(line_tokens)

        return false if tokens_without_space_or_comment.empty?

        last_token = tokens_without_space_or_comment.last
        last_text = last_token[:text]

        CONTINUATION_TEXTS.include?(last_text) || label_token?(last_token)
      end

      def endless_def_line?(line_tokens)
        tokens_without_space_or_comment =
          tokens_without_space_or_comment(line_tokens)

        def_token_index = tokens_without_space_or_comment.length - 1

        while def_token_index >= 0 &&
              !keyword_token?(
                tokens_without_space_or_comment[def_token_index],
                ['def']
              )

          def_token_index -= 1
        end

        return false if def_token_index < 0

        equal_token_index = def_token_index + 1

        while equal_token_index < tokens_without_space_or_comment.length &&
              tokens_without_space_or_comment[equal_token_index][:text] != '='

          equal_token_index += 1
        end

        equal_token_index < tokens_without_space_or_comment.length
      end

      def tokens_without_space_or_comment(line_tokens)
        line_tokens.reject do |token|
          token[:type] == 'comment' || token[:text].strip == ''
        end
      end

      def first_token_without_space_or_comment(line_tokens)
        tokens_without_space_or_comment(line_tokens).first
      end

      def keyword_token?(token, expected_texts)
        token && token[:type] == 'keyword' &&
          expected_texts.include?(token[:text])
      end

      def label_token?(token)
        token[:type] == 'symbol' && token[:text].end_with?(':')
      end
    end
  end

  module IndentCalculator
    INDENT_UNIT = '  '

    class << self
      def make_next_line_indent(cursor_line_text, should_increase_indent)
        cursor_line_indent = leading_indent(cursor_line_text)

        if should_increase_indent
          return cursor_line_indent + INDENT_UNIT
        end

        cursor_line_indent
      end

      def make_decreased_indent_line_text(cursor_line_text)
        cursor_line_indent = leading_indent(cursor_line_text)

        decreased_indent =
          cursor_line_indent[0, cursor_line_indent.length - INDENT_UNIT.length]

        decreased_indent + cursor_line_text.strip
      end

      def leading_indent(line_text)
        space_count = 0

        while space_count < line_text.length && line_text[space_count] == ' '
          space_count += 1
        end

        line_text[0, space_count]
      end
    end
  end

end

AutoIndent.init
