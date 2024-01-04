require 'fileutils'
require_relative File.expand_path("../../lib/rbs_doc", __FILE__)

namespace :rbs_doc do
  task :default => :generate

  desc "Generate documentation"
  task :generate do |t, args|
    FileUtils.cd File.expand_path("../../../picoruby", __FILE__) do
      steepfile = ENV['STEEPFILE'] || File.expand_path("../../../picoruby/Steepfile", __FILE__)
      RBSDoc::Generator.new(steepfile: steepfile)
    end
  end
end
