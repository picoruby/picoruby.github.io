module RBSDoc
  class ClassFormatter
    def initialize(path)
      @info = []
      @global_type_aliases = []
      sig = RBS::Parser.parse_signature(File.read(path))
      sig[2].each do |dec|
        case dec
        when RBS::AST::Declarations::Class
          format_class(dec)
        when RBS::AST::Declarations::TypeAlias
          @global_type_aliases << format_type_alias(dec)
        end
      end
      @global_type_aliases.sort_by! do |type_alias|
        [type_alias[:name]]
      end
    end

    attr_reader :info, :global_type_aliases

    def format_class(dec, upper_class = [])
      @info << Hash.new.tap do |klass|
        klass[:class] = upper_class + [dec.name.name]
        klass[:super_class] = dec.super_class.name.name if dec.super_class
        klass[:methods] = {instance: [], singleton: []}
        klass[:type_aliases] = []
        klass[:attr_accessors] = []
        klass[:comment] = dec.comment.string if dec.comment
        dec.members.each do |member|
          case member
          when RBS::AST::Members::MethodDefinition
            next if member.comment&.string&.include?("@ignore")
            # Todo: private method
            next if member.comment&.string&.include?("@private")
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
          when RBS::AST::Members::AttrAccessor, RBS::AST::Members::AttrReader, RBS::AST::Members::AttrWriter
            klass[:attr_accessors] << {
              name: member.name,
              accessor_type: member.class.to_s.split("::").last.gsub(/Attr/, "").downcase,
              type: member.type.class,
              source: member.type.location.source
            }
          else
            #pp member.class.to_s
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
end
