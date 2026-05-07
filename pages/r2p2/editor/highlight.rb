module SyntaxHighlight
  def self.init
    editor = JS.document.getElementById('editor')
    highlight_layer = JS.document.getElementById('highlight-layer')
    content = JS.document.getElementById('highlight-content')

    session = Session.new(editor, highlight_layer, content)
    session.attach
  end

  class Session
    def initialize(editor, highlight_layer, content)
      @editor = editor
      @highlight_layer = highlight_layer
      @content = content
      @line_cache = []
    end

    def attach
      @editor.addEventListener('refresh-highlight') do
        refresh_highlight
      end

      @editor.addEventListener('render-highlight-viewport') do
        render_highlight_viewport
      end
    end

    private

    def refresh_highlight
      source = @editor[:value].to_s

      if source.empty?
        clear_highlight
      else
        @line_cache = CacheBuilder.rebuild(@line_cache, source)
        render_highlight_viewport
      end
    rescue StandardError
      p 'refresh highlight error'
      @line_cache = []
    end

    def render_highlight_viewport
      ViewportRenderer.render(
        @editor,
        @content,
        @highlight_layer,
        @line_cache
      )
    rescue StandardError
      p 'viewport rendering error'
    end

    def clear_highlight
      @line_cache = []
      @content[:style][:paddingTop] = ''
      @content[:innerHTML] = ''
      @highlight_layer[:style][:top] = '0px'
      @highlight_layer[:style][:left] = '0px'
    end
  end

  # Cache tokens per input line so unchanged lines can be reused instead of tokenizing every line each time.
  module CacheBuilder
    def self.rebuild(cached_line_entries, source)
      # Keep trailing empty elements with -1 so the input source is represented as complete line data.
      lines = source.split("\n", -1)

      line_count = lines.length
      line_delta = line_count - cached_line_entries.length
      change_start_index = find_change_start_index(lines, cached_line_entries)
      new_line_entries = cached_line_entries[0, change_start_index]

      lines[change_start_index, line_count].each_with_index do |line_text, offset|
        line_index = change_start_index + offset

        cached_line_entry =
          cached_line_entry_for(
            cached_line_entries,
            line_index,
            line_delta
          )

        if line_cache_valid?(cached_line_entry, line_text)
          new_line_entries << cached_line_entry

          next
        end

        new_line_entries << make_line_cache_entry(line_text)
      end

      new_line_entries
    end

    def self.find_change_start_index(lines, cached_line_entries)
      max_index = [lines.length, cached_line_entries.length].min

      max_index.times do |idx|
        return idx if lines[idx] != cached_line_entries[idx][:line_text]
      end

      max_index
    end

    def self.cached_line_entry_for(
      cached_line_entries,
      line_index,
      line_delta
    )
      cached_line_entry_index = line_index - line_delta

      if cached_line_entry_index < 0 ||
         cached_line_entry_index >= cached_line_entries.length

        return nil
      end

      cached_line_entries[cached_line_entry_index]
    end

    def self.line_cache_valid?(cached_line_entry, line_text)
      cached_line_entry && cached_line_entry[:line_text] == line_text
    end

    def self.make_line_cache_entry(line_text)
      tokens = Tokenizer.tokenize(line_text)

      {
        line_text: line_text,
        tokens: tokens
      }
    end
  end

  module ViewportRenderer
    BUFFER_LINES = 5

    def self.render(editor, content, highlight_layer, line_cache)
      return if line_cache.empty?

      line_height, padding_top = editor_metrics(editor)

      first_line_index, last_line_index =
        visible_line_range(editor, line_cache, line_height, padding_top)

      set_highlight_content(
        content,
        line_cache,
        first_line_index,
        last_line_index,
        line_height,
        padding_top
      )

      apply_highlight_scroll_offset(editor, highlight_layer)
    end

    private

    def self.visible_line_range(editor, line_cache, line_height, padding_top)
      scroll_top = editor[:scrollTop].to_f
      client_height = editor[:clientHeight].to_f

      first_line_index =
        first_visible_line_index(scroll_top, line_height, padding_top)

      last_line_index =
        last_visible_line_index(
          scroll_top,
          client_height,
          line_cache,
          line_height,
          padding_top
        )

      [first_line_index, last_line_index]
    end

    def self.set_highlight_content(
      content,
      line_cache,
      first_line_index,
      last_line_index,
      line_height,
      padding_top
    )
      # Render only the visible range, then fill the height up to the first line with padding to align with the textarea scroll position.
      content[:style][:paddingTop] =
        "#{first_line_top_offset(first_line_index, line_height, padding_top)}px"

      content[:innerHTML] =
        render_visible_html(line_cache, first_line_index, last_line_index)
    end

    def self.apply_highlight_scroll_offset(editor, highlight_layer)
      highlight_layer[:style][:top] = "#{-editor[:scrollTop].to_f}px"
      highlight_layer[:style][:left] = "#{-editor[:scrollLeft].to_f}px"
    end

    def self.render_visible_html(line_cache, first_line_index, last_line_index)
      result = []

      (first_line_index..last_line_index).each do |line_index|
        result << HtmlBuilder.make_line_html(line_cache[line_index])

        if line_index < line_cache.length - 1
          result << HtmlBuilder.make_newline_html
        end
      end

      result.join
    end

    def self.first_visible_line_index(scroll_top, line_height, padding_top)
      text_scroll_top = scroll_top - padding_top
      [(text_scroll_top / line_height).floor - BUFFER_LINES, 0].max
    end

    def self.last_visible_line_index(
      scroll_top,
      client_height,
      line_cache,
      line_height,
      padding_top
    )
      text_scroll_bottom = scroll_top + client_height - padding_top

      [
        (text_scroll_bottom / line_height).ceil + BUFFER_LINES,
        line_cache.length - 1
      ].min
    end

    def self.first_line_top_offset(first_line_index, line_height, padding_top)
      padding_top + first_line_index * line_height
    end

    def self.editor_metrics(editor)
      style = JS.global.getComputedStyle(editor)
      [
        style[:lineHeight].to_s.to_f,
        style[:paddingTop].to_s.to_f
      ]
    end
  end

  module HtmlBuilder
    TOKEN_CLASSES = {
      'keyword' => 'hl-keyword',
      'builtinLiteral' => 'hl-builtin-literal',
      'constant' => 'hl-constant',
      'method' => 'hl-method',
      'string' => 'hl-string',
      'escape' => 'hl-escape',
      'regexp' => 'hl-regexp',
      'symbol' => 'hl-symbol',
      'number' => 'hl-number',
      'comment' => 'hl-comment',
      'specialVariable' => 'hl-special-variable',
      'interpolation' => 'hl-interpolation',
      'default' => 'hl-default'
    }

    def self.make_line_html(entry)
      entry[:tokens].map { |token| make_token_html(token) }.join
    end

    def self.make_newline_html
      make_token_span('default', "\n")
    end

    private

    def self.make_token_html(token)
      make_token_span(token[:type], token[:text])
    end

    def self.make_token_span(type, text)
      cls = token_class(type)
      "<span class=\"#{cls}\">#{escape_html(text)}</span>"
    end

    def self.token_class(type)
      TOKEN_CLASSES[type] || TOKEN_CLASSES['default']
    end

    def self.escape_html(text)
      text.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;')
    end
  end
end

SyntaxHighlight.init
