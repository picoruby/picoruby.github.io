require "fileutils"

task :default => :all

desc "Run all tasks"
task :all => [:submodule, :documentation, :jekyll]

desc "Update submodule"
task :submodule do
  sh "git submodule update --init"
end

desc "Generate documentation"
task :documentation do
  require_relative "lib/rbs_doc"
  steepfile = ENV['STEEPFILE'] || File.expand_path("../submodules/picoruby/Steepfile", __FILE__)
  RBSDoc::Generator.new(steepfile: steepfile).generate
end

desc "Run jekyll"
task :jekyll do
#  sh "bundle exec jekyll serve"
end
