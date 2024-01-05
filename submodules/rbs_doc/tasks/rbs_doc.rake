require 'fileutils'
require_relative File.expand_path("../../lib/rbs_doc", __FILE__)

namespace :rbs_doc do
  task :default => :generate

  desc "Generate documentation"
  task :generate do |t, args|
    FileUtils.cd File.expand_path("../../../picoruby", __FILE__) do
      steepfile = ENV['STEEPFILE'] || File.expand_path("../../../picoruby/Steepfile", __FILE__)
      output_dir = ENV['OUTPUT'] || File.expand_path("../../../../pages/rbs_doc", __FILE__)
      sidebar_path = ENV['SIDEBAR'] || File.expand_path("../../../../_data/sidebars/picoruby_sidebar.yml", __FILE__)
      RBSDoc::Generator.new(
        steepfile: steepfile,
        output_dir: output_dir,
        sidebar_path: sidebar_path
      )
    end
  end
end
