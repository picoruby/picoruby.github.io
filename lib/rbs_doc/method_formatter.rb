module RBSDoc
  class MethodFormatter
    def initialize(method)
      @info = {
        name: method.name,
        visibility: method.visibility
      }
      @info[:overloads] = method.overloads.map do |overload|
        format_overload(overload)
      end
    end

    attr_reader :info

    PARAM_KINDS = %i[
      required_positionals
      optional_positionals
      rest_positionals
      trailing_positionals
      required_keywords
      optional_keywords
      rest_keywords
    ].freeze

    def format_overload(overload)
      Hash.new.tap do |member|
        member[:source] = overload.method_type.location.source
        PARAM_KINDS.each do |key|
          format_params1(key, overload.method_type.type).then do |params|
            member[key] = params if params && !params.empty?
          end
        end
        if overload.method_type.block
          member[:block] = {}
          PARAM_KINDS.each do |key|
            format_params1(key, overload.method_type.block.type).then do |params|
              member[:block][key] = params if params && !params.empty?
            end
          end
        end
        member[:return_type] = {
          class: overload.method_type.type.return_type.class,
          source: overload.method_type.type.return_type.location.source
        }
      end
    end

    def format_params1(key, type)
      params = type.send(key)
      if params.respond_to?(:map)
        params.map do |param|
          format_param(param)
        end
      else
        format_param(params) if params
      end
    end

    def format_param(param)
      if param.respond_to?(:[])
        { param[0] => format_param2(param[1]) }
      else
        format_param2(param)
      end
    end

    def format_param2(param)
      Hash.new.tap do |h|
        h[:name] = param.name
        h[:class] = case param.type
        when RBS::Types::Union
          param.type.types.map(&:class)
        else
          param.type.class
        end
        h[:source] = param.type.location.source
      end
    rescue => e
      binding.irb
    end
  end
end
