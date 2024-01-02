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

    def format
      @info.to_s
    end

    def format_overload(overload)
      type = overload.method_type.type
      {
        requied_positionals: format_requied_positionals(type)
        #format_optional_positionals
        #format_optional_keywords
        #format_required_keywords
        #format_rest_positionals
        #format_rest_keywords
        #format_trailing_positionals
        #overload.method_type.block
        #format_type.return_type
      }
    end

    def format_requied_positionals(type)
      type.required_positionals.map do |param|
        Hash.new.tap do |h|
          h[:name] = param.name&.to_s || "arg"
          h[:type] = case param.type
          when RBS::Types::ClassInstance
            param.type.name.to_s
          when RBS::Types::Union
            param.type.types.map do |type|
              type.to_s
            end.join(" | ")
          when RBS::Types::Bases::Bool
            "bool"
          when RBS::Types::Alias
            param.type.name.to_s
          when RBS::Types::Tuple, RBS::Types::Literal, RBS::Types::Bases::Any
            param.type.location.source
          else
            raise "unknown type: #{param.type}"
          end
        end
      end
    end
  end

  class Generator
    def initialize(steepfile:)
      @steep_config = SteepConfig.new(steepfile)
    end

    def generate
      @steep_config.config.targets[0].signature_pattern.patterns.each do |pattern|
        Dir.glob("#{pattern}*.rbs").each do |path|
          sig = RBS::Parser.parse_signature(File.read(path))
          p path
          sig[2].each do |dec|
            case dec
            when RBS::AST::Declarations::Class
              dec.members.each do |member|
                case member
                when RBS::AST::Members::MethodDefinition
                  formatter = RBSDoc::MethodFormatter.new(member)
                  p formatter.format
                end
              end
            end
          end
        end
      end
    end
  end
end
