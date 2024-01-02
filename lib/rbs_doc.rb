require "rbs"
require "active_support"
require "steep"

module RBSDoc
  class SteepConfig
    include Steep::Drivers::Utils::DriverHelper
    def initialize(steepfile)
      @config = load_config(path: Pathname(steepfile))
    end
    attr_reader :config
  end

  class MethodFormatter
    def initialize(method)
      @info = { name: method.name }
      @info[:overloads] = method.overloads.map do |overload|
        format_overload(overload)
      end
    end

    attr_reader :info

    def format_overload(overload)
      # overload.method_type.block
      # type.return_type
      Hash.new.tap do |member|
        %i[required_positionals optional_positionals rest_positionals trailing_positionals required_keywords optional_keywords rest_keywords].each do |key|
          format_params(key, overload.method_type.type).then do |params|
            member[key] = params if params && !params.empty?
          end
        end
      end
    end

    def format_params(key, type)
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
        h[:type] = case param.type
        when RBS::Types::ClassInstance
          param.type.name.to_s
        when RBS::Types::Union
          param.type.types&.map do |type|
            type.to_s
          end.join(" | ")
        when RBS::Types::Bases::Bool
          "bool"
        when RBS::Types::Alias
          param.type.name.to_s
        when RBS::Types::Tuple, RBS::Types::Literal, RBS::Types::Bases::Any
          param.type.location.source
        else
          param.type.location.source
        end
      end
    rescue => e
      binding.irb
    end
  end

  class Generator
    def initialize(steepfile:)
      @steep_config = SteepConfig.new(steepfile)
    end

    def generate
      @result = []
      @steep_config.config.targets[0].signature_pattern.patterns.each do |pattern|
        Dir.glob("#{pattern}*.rbs").map do |path|
          @result << Hash.new.tap do |h|
            sig = RBS::Parser.parse_signature(File.read(path))
            sig[2].each do |dec|
              case dec
              when RBS::AST::Declarations::Class
                h[:class] = sig[2].first.name.name
                h[:methods] = []
                dec.members.each do |member|
                  case member
                  when RBS::AST::Members::MethodDefinition
                    formatter = RBSDoc::MethodFormatter.new(member)
                    h[:methods] << formatter.info
                  end
                end
              end
            end
          end
        end
      end
      pp @result
    end
  end
end
