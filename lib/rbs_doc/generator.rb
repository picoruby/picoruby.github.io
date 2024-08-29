module RBSDoc
  class Generator
    def initialize(steepfile:, output_dir:, sidebar_path:)
      @output_dir = output_dir
      Dir.glob("#{@output_dir}/*.md") do |path|
        File.delete(path)
      end
      @formatter = []
      @steep_config = SteepConfig.new(steepfile)
      @steep_config.config.targets[0].signature_pattern.patterns.each do |pattern|
        Dir.glob("#{pattern}*.rbs").map do |path|
          @formatter << ClassFormatter.new(path)
        end
      end
      @sidebars = {
        "type_alias" => [{
          title: "Type alias",
          url: "/type_alias.html",
        }],
      }
      generate_pages
      @sidebars.keys.each do |key|
        @sidebars[key].sort_by! { |item| [item[:title]] }
      end
      @sidebars = @sidebars.sort.to_h
      generate_sidebar(sidebar_path)
    end

    def generate_sidebar(path)
      yaml = YAML.load_file("#{path}.template")
      @sidebars.keys.each do |key|
        title = case key
                when "type_alias"
                  "Type alias"
                when "builtin"
                  "Builtin"
                when "io_peripheral"
                  "IO Peripheral"
                when "prk_firmware"
                  "PRK Firmware"
                when "hardware_device"
                  "Hardware Device"
                when "error"
                  "Error"
                else
                  "General"
                end
        yaml["entries"][0]["folders"] << {
          "title" => title,
          "output" => "web pdf",
          "folderitems" => @sidebars[key].map do |item|
            {
              "title" => "#{item[:type]} #{item[:title]}",
              "url" => item[:url],
              "output" => "web pdf",
              "type" => "homepage"
            }
          end
        }
      end
      YAML.dump(yaml, File.open(path, "w"))
    end

    def add_sidebar(key, type, title, url)
      @sidebars[key] ||= []
      if @sidebars[key].none? {|item| item[:title] == title }
        @sidebars[key] << {type: type, title: title, url: url}
      end
    end

    def generate_pages
      @formatter.each do |formatter|
        formatter.global_type_aliases.each do |type_alias|
          filename = File.join(@output_dir, "type_alias.md")
          unless File.exist?(filename)
            File.open(filename, "w") do |f|
              f.puts "---"
              f.puts "title: Type aliases"
              f.puts "sidebar: picoruby_sidebar"
              f.puts "permalink: /type_alias.html"
              f.puts "folder: rbs_doc"
              f.puts "---\n\n"
            end
          end
          File.open(filename, "a") do |f|
            f.puts "## #{type_alias[:name]}\n"
            f.puts "```rbs"
            f.puts type_alias[:source]
            f.puts "```\n\n"
          end
        end
        formatter.info.each do |namespace|
          basename = namespace[:namespace].join("_")
          filename = File.join(@output_dir, basename + ".md")
          next if ["@private", "@ignore"].any?{ namespace[:comment]&.include?(_1) }
          added_by = if data = namespace[:comment]&.match(/@added_by\s+(.+)\s*$/)
                      " (#{data[1]})"
                     else
                       ""
                     end
          namespacename = namespace[:namespace].join("::")
          if data = namespace[:comment]&.match("@sidebar\s+(.+)\s*$")
            add_sidebar(data[1], namespace[:type], namespacename, "/#{basename}.html")
          else
            add_sidebar("optional", namespace[:type], namespacename, "/#{basename}.html")
          end
          unless File.exist?(filename)
            File.open(filename, "w") do |f|
              f.puts "---"
              f.puts "title: #{namespace[:type]} #{namespacename}"
              f.puts "keywords: #{namespacename}"
              f.puts "tags: [#{namespace[:type]}]"
              f.puts "summary: #{namespacename} #{namespace[:type]} of PicoRuby"
              f.puts "sidebar: picoruby_sidebar"
              f.puts "permalink: #{basename}.html"
              f.puts "folder: rbs_doc"
              f.puts "---\n"
            end
          end
          File.open(filename, "a") do |f|
            if namespace[:include]
              f.puts "## Include\n"
              f.puts "[#{namespace[:include]}](#{namespace[:include]}.html)\n"
            end
            f.puts "## Type aliases\n" unless namespace[:type_aliases].empty?
            namespace[:type_aliases].each do |type_alias|
              f.puts "### #{type_alias[:name]}\n"
              f.puts "```ruby"
              f.puts type_alias[:source]
              f.puts "```\n"
            end
            [:singleton, :instance].each do |kind|
              next if namespace[:methods][kind].count{|m| m[:visibility] != :private } == 0
              f.puts "## #{kind.to_s.capitalize} methods#{added_by}\n"
              namespace[:methods][kind].each do |method|
                next if method[:visibility] == :private
                name = method[:name] == :initialize ? "new" : method[:name]
                f.puts "### #{name}\n"
                f.puts
                f.puts "```ruby"
                method[:overloads].each do |overload|
                  f.print(kind == :singleton ? namespacename + "." : "instance.")
                  f.print name
                  f.puts overload[:source]
                end
                f.puts "```\n"
              end
            end
            if namespace[:attr_accessors]
              f.puts "## Attr accessors\n" unless namespace[:attr_accessors].empty?
              namespace[:attr_accessors].each do |attr_accessor|
                f.puts "### #{attr_accessor[:name]} (#{attr_accessor[:accessor_type]})\n"
                f.puts "```ruby"
                f.puts "instance.#{attr_accessor[:name]} -> #{attr_accessor[:source]}"
                f.puts "```\n"
              end
            end
          end
        end
      end
    end
  end
end
