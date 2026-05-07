module Tokenizer
  KEYWORD_LIKE_IDENTIFIERS = %w[
    raise
    fail
    require
    include
    extend
    prepend
    attr
    attr_accessor
    attr_reader
    attr_writer
    public
    protected
    private
    lambda
    caller
    eval
    class_eval
    instance_eval
    module_eval
    exit
    loop
    define_method
    alias_method
    remove_method
    undef_method
  ]

  BUILTIN_LITERAL_TOKENS = %w[
    KEYWORD_NIL
    KEYWORD_TRUE
    KEYWORD_FALSE
    KEYWORD_SELF
    KEYWORD___FILE__
    KEYWORD___ENCODING__
  ]

  NUMBER_TOKENS = %w[
    INTEGER
    FLOAT
  ]

  SPECIAL_VARIABLE_TOKENS = %w[
    INSTANCE_VARIABLE
    CLASS_VARIABLE
    GLOBAL_VARIABLE
    BACK_REFERENCE
    NUMBERED_REFERENCE
  ]

  INTERPOLATION_TOKENS = %w[
    EMBEXPR_BEGIN
    EMBEXPR_END
    EMBVAR
  ]

  def self.tokenize(source)
    # Return a default token to keep the editor working when Prism is unavailable.
    return [{ type: 'default', text: source }] unless JS.global[:prismReady]

    js_prism_tokens = JS.global.lexPrism(source)
    build_tokens(source, js_prism_tokens)
  rescue StandardError
    p 'tokenize error'
    [{ type: 'default', text: source }]
  end

  def self.build_tokens(source, js_prism_tokens)
    tokens = []

    last_token_end = 0
    literal_context = nil
    expect_symbol_name = false
    expect_method_name = false

    (0...js_prism_tokens[:length].to_i).each do |idx|
      js_prism_token = js_prism_tokens[idx]

      prism_type = js_prism_token[:type].to_s
      next if prism_type == 'EOF'

      start_offset = js_prism_token[:startOffset].to_i
      end_offset = start_offset + js_prism_token[:length].to_i

      # Fill text that Prism does not tokenize with default tokens.
      if start_offset > last_token_end
        tokens << make_missing_token(source, last_token_end, start_offset)
      end

      token_text = source_slice(source, start_offset, end_offset)

      if expect_symbol_name
        expect_symbol_name = false

        tokens << {
          type: 'symbol',
          text: token_text
        }

        last_token_end = end_offset

        next
      end

      token_type =
        case prism_type
        when 'KEYWORD_DEF'
          expect_method_name = true
          'keyword'

        when 'STRING_BEGIN'
          literal_context = 'string'
          'string'

        when 'REGEXP_BEGIN'
          literal_context = 'regexp'
          'regexp'

        when 'SYMBOL_BEGIN'
          if token_text == ':'
            expect_symbol_name = true
          else
            literal_context = 'quoted_symbol'
          end

          'symbol'

        when 'STRING_END', 'LABEL_END'
          token_type =
            if literal_context == 'quoted_symbol'
              'symbol'
            else
              'string'
            end

          literal_context = nil
          token_type

        when 'REGEXP_END'
          literal_context = nil
          'regexp'

        when 'STRING_CONTENT'
          case literal_context
          when 'quoted_symbol'
            'symbol'
          when 'string', 'regexp'
            literal_context
          else
            'string'
          end

        when 'CHARACTER_LITERAL'
          'string'

        when 'LABEL'
          'symbol'

        when 'CONSTANT'
          'constant'

        when 'METHOD_NAME'
          expect_method_name = false
          'method'

        when *INTERPOLATION_TOKENS
          'interpolation'

        when 'IDENTIFIER'
          if expect_method_name
            expect_method_name = false
            'method'
          elsif KEYWORD_LIKE_IDENTIFIERS.include?(token_text)
            'keyword'
          else
            'default'
          end

        when 'COMMENT'
          'comment'

        when *SPECIAL_VARIABLE_TOKENS
          'specialVariable'

        when *NUMBER_TOKENS
          'number'

        when *BUILTIN_LITERAL_TOKENS
          'builtinLiteral'

        else
          if prism_type.start_with?('KEYWORD_')
            'keyword'
          else
            'default'
          end
        end

      tokens << {
        type: token_type,
        text: token_text
      }

      last_token_end = end_offset
    end

    if last_token_end < source.length
      tokens << make_missing_token(source, last_token_end, source.length)
    end

    tokens
  end

  def self.make_missing_token(source, last_token_end, next_token_start)
    {
      type: 'default',
      text: source_slice(source, last_token_end, next_token_start)
    }
  end

  def self.source_slice(source, start_offset, end_offset)
    source.slice(start_offset, end_offset - start_offset).to_s
  end
end
