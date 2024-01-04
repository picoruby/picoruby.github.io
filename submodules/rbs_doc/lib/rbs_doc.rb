require "rbs"
require "active_support"

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
      @info = {
        name: method.name,
        kind: method.kind,
        visibility: method.visibility
      }
      @info[:overloads] = method.overloads.map do |overload|
        format_overload(overload)
      end
    end

    attr_reader :info

    def format_overload(overload)
      Hash.new.tap do |member|
        member[:source] = overload.method_type.location.source
        %i[required_positionals optional_positionals rest_positionals trailing_positionals required_keywords optional_keywords rest_keywords].each do |key|
          format_params1(key, overload.method_type.type).then do |params|
            member[key] = params if params && !params.empty?
          end
        end
        if overload.method_type.block
          member[:block] = {}
          %i[required_positionals optional_positionals rest_positionals trailing_positionals required_keywords optional_keywords rest_keywords].each do |key|
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

  class Generator
    def initialize(steepfile:)
      @steep_config = SteepConfig.new(steepfile)
      @steep_config.config.targets[0].signature_pattern.patterns.each do |pattern|
        Dir.glob("#{pattern}/*.rbs").map do |path|
          generate(path)
        end
      end
    end

    def generate(path)
      @result = []
      sig = RBS::Parser.parse_signature(File.read(path))
      sig[2].each do |dec|
        case dec
        when RBS::AST::Declarations::Class
          generate_class(dec)
        end
      end
      pp @result
    end

    def generate_class(dec, upper_class = [])
      @result << Hash.new.tap do |klass|
        klass[:class] = upper_class + [dec.name.name]
        klass[:super_class] = dec.super_class.name.name if dec.super_class
        klass[:methods] = []
        dec.members.each do |member|
          case member
          when RBS::AST::Members::MethodDefinition
            formatter = RBSDoc::MethodFormatter.new(member)
            klass[:methods] << formatter.info
            klass[:methods].sort_by! do |method|
              method[:name]
            end
          when RBS::AST::Declarations::Class
            generate_class(member, klass[:class])
          end
        end
      end
    end
  end
end
