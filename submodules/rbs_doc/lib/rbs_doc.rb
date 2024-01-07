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

  class ClassFormatter
    def initialize(path)
      @info = []
      sig = RBS::Parser.parse_signature(File.read(path))
      sig[2].each do |dec|
        case dec
        when RBS::AST::Declarations::Class
          format_class(dec)
        end
      end
    end

    attr_reader :info

    def format_class(dec, upper_class = [])
      @info << Hash.new.tap do |klass|
        klass[:class] = upper_class + [dec.name.name]
        klass[:super_class] = dec.super_class.name.name if dec.super_class
        klass[:methods] = {instance: [], singleton: []}
        klass[:type_aliases] = []
        klass[:comment] = dec.comment.string if dec.comment
        dec.members.each do |member|
          case member
          when RBS::AST::Members::MethodDefinition
            formatter = RBSDoc::MethodFormatter.new(member)
            if member.kind == :singleton
              klass[:methods][:singleton] << formatter.info
            else
              if member.name == :initialize
                klass[:methods][:singleton] << formatter.info
              else
                klass[:methods][:instance] << formatter.info
              end
            end
            klass[:methods][:singleton].sort_by! do |method|
              [method[:name]]
            end
            klass[:methods][:instance].sort_by! do |method|
              [method[:name]]
            end
          when RBS::AST::Declarations::Class
            format_class(member, klass[:class])
          when RBS::AST::Declarations::TypeAlias
            klass[:type_aliases] << format_type_alias(member)
          end
        end
      end
    end

    def format_type_alias(dec)
      Hash.new.tap do |type_alias|
        type_alias[:name] = dec.name.name
        type_alias[:source] = dec.type.location.source
      end
    end
  end

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

  class Generator
    def initialize(steepfile:, output_dir:, sidebar_path:)
      @output_dir = output_dir
      Dir.glob("#{@output_dir}/*.md") do |path|
        File.delete(path)
      end
      @formatter = []
      @steep_config = SteepConfig.new(steepfile)
      @steep_config.config.targets[0].signature_pattern.patterns.each do |pattern|
        Dir.glob("#{pattern}/*.rbs").map do |path|
          @formatter << ClassFormatter.new(path)
        end
      end
      @sidebars = {}
      generate_pages
      @sidebars.keys.each do |key|
        @sidebars[key].sort_by! do |item|
          [item[:title]]
        end
      end
      @sidebars = @sidebars.sort.to_h
      generate_sidebar(sidebar_path)
    end

    def generate_sidebar(path)
      yaml = YAML.load_file("#{path}.template")
      @sidebars.keys.each do |key|
        title = case key
                when "builtin"
                  "Builtin class"
                when "io_peripheral"
                  "IO Peripheral class"
                when "prk_firmware"
                  "PRK Firmware class"
                when "hardware_device"
                  "Hardware Device class"
                else
                  "misc"
                end
        yaml["entries"][0]["folders"] << {
          "title" => title,
          "output" => "web pdf",
          "folderitems" => @sidebars[key].map do |item|
            {
              "title" => item[:title],
              "url" => item[:url],
              "output" => "web pdf",
              "type" => "homepage"
            }
          end
        }
      end
      YAML.dump(yaml, File.open(path, "w"))
    end

    def add_sidebar(key, title, url)
      @sidebars[key] ||= []
      if @sidebars[key].none? {|item| item[:title] == title }
        @sidebars[key] << {title: title, url: url}
      end
    end

    def generate_pages
      @formatter.each do |formatter|
        formatter.info.each do |klass|
          basename = klass[:class].join("_")
          filename = File.join(@output_dir, basename + ".md")
          next if klass[:comment]&.include?("@private")
          added_by = if data = klass[:comment]&.match(/@added_by\s+(.+)\s*$/)
                      " (#{data[1]})"
                     else
                       ""
                     end
          classname = klass[:class].join("::")
          if data = klass[:comment]&.match("@sidebar\s+(.+)\s*$")
            add_sidebar(data[1], classname, "/#{basename}.html")
          else
            add_sidebar("optional", classname, "/#{basename}.html")
          end
          unless File.exist?(filename)
            File.open(filename, "w") do |f|
              f.puts "---"
              f.puts "title: #{classname}"
              f.puts "sidebar: picoruby_sidebar"
              f.puts "permalink: #{basename}.html"
              f.puts "folder: rbs_doc"
              f.puts "---\n"
            end
          end
          File.open(filename, "a") do |f|
            f.puts "## Type aliases\n" unless klass[:type_aliases].empty?
            klass[:type_aliases].each do |type_alias|
              f.puts "### #{type_alias[:name]}\n"
              f.puts "```ruby"
              f.puts type_alias[:source]
              f.puts "```\n"
            end
            [:singleton, :instance].each do |kind|
              next if klass[:methods][kind].count{|m| m[:visibility] != :private } == 0
              f.puts "## #{kind.to_s.capitalize} methods#{added_by}\n"
              klass[:methods][kind].each do |method|
                next if method[:visibility] == :private
                name = method[:name] == :initialize ? "new" : method[:name]
                f.puts "### #{name}\n"
                f.puts
                f.puts "```ruby"
                method[:overloads].each do |overload|
                  f.print classname + "." if kind == :singleton
                  f.print name
                  f.puts overload[:source]
                end
                f.puts "```\n"
              end
            end
          end
        end
      end
    end
  end

end
