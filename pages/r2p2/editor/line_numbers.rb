require 'js'

module LineNumbers
  class << self
    def init
      editor = JS.document.getElementById('editor')
      line_numbers = JS.document.getElementById('line-numbers-inner')

      session = Session.new(editor, line_numbers)
      session.attach
    end
  end

  class Session
    def initialize(editor, line_numbers)
      @editor = editor
      @line_numbers = line_numbers
      # Initialize to -1 so the first render_line_numbers always runs.
      @rendered_total_line_count = -1
      @rendered_active_line_number = -1
    end

    def attach
      @editor.addEventListener('sync-line-number-scroll') do
        sync_scroll
      end

      @editor.addEventListener('refresh-line-numbers') do
        refresh_line_numbers
      end

      @editor.addEventListener('refresh-active-line-number') do
        refresh_active_line_number
      end
    end

    private

    def sync_scroll
      @line_numbers[:style][:top] = "#{-@editor[:scrollTop].to_i}px"
    end

    def refresh_line_numbers
      editor_text = @editor[:value].to_s
      cursor_position = @editor[:selectionStart].to_i

      render_line_numbers(
        LineMetrics.line_count(editor_text),
        LineMetrics.active_line_number(editor_text, cursor_position)
      )
    end

    def refresh_active_line_number
      editor_text = @editor[:value].to_s
      cursor_position = @editor[:selectionStart].to_i

      render_line_numbers(
        @rendered_total_line_count,
        LineMetrics.active_line_number(editor_text, cursor_position)
      )
    end

    def render_line_numbers(total_line_count, active_line_number)
      return if total_line_count == @rendered_total_line_count &&
                active_line_number == @rendered_active_line_number

      @line_numbers[:innerHTML] =
        HtmlBuilder.make_line_numbers_html(total_line_count, active_line_number)

      @rendered_total_line_count = total_line_count
      @rendered_active_line_number = active_line_number
    end
  end

  module LineMetrics
    class << self
      def line_count(text)
        count = text.split("\n", -1).length

        # An empty buffer is still one line.
        if count < 1
          1
        else
          count
        end
      end

      def active_line_number(editor_text, cursor_position)
        text_before_cursor = editor_text[0...cursor_position]

        line_count(text_before_cursor)
      end
    end
  end

  module HtmlBuilder
    class << self
      def make_line_numbers_html(line_count, active_line_number)
        (1..line_count).map { |line_number|
          make_line_number_html(line_number, active_line_number)
        }.join("\n")
      end

      private

      def make_line_number_html(line_number, active_line_number)
        cls =
          if line_number == active_line_number
            'line-number active'
          else
            'line-number'
          end

        "<span class=\"#{cls}\">#{line_number}</span>"
      end
    end
  end
end

LineNumbers.init
