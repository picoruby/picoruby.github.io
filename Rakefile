require "fileutils"

task :default => :all

desc "Run all tasks"
task :all => ["rbs_doc:generate"]

desc "Setup"
task :setup => [:install_steep, :install_picoruby]

task :install_steep do
  FileUtils.cd "lib" do
    sh "bundle install"
  end
end

PICORUBY_DIR = "picoruby"
MRUBYC_DIR = "picoruby/mrbgems/picoruby-mrubyc/repos/mrubyc"

desc "Git clone picoruby and mruby/c"
task :install_picoruby => [PICORUBY_DIR, MRUBYC_DIR]

directory PICORUBY_DIR do
  sh "git clone https://github.com/picoruby/picoruby.git"
end

directory MRUBYC_DIR do
  FileUtils.cd("picoruby/mrbgems/picoruby-mrubyc/repos") do
    sh "git clone https://github.com/mrubyc/mrubyc.git"
  end
end

desc "Run jekyll"
task :s do
  sh "bundle exec jekyll serve"
end


require_relative File.expand_path("../lib/rbs_doc", __FILE__)

namespace :rbs_doc do
  task :default => :generate

  desc "Generate documentation"
  task :generate do |t, args|
    FileUtils.cd File.expand_path("../picoruby", __FILE__) do
      steepfile = ENV['STEEPFILE'] || File.expand_path("../picoruby/Steepfile", __FILE__)
      output_dir = ENV['OUTPUT'] || File.expand_path("../pages/rbs_doc", __FILE__)
      sidebar_path = ENV['SIDEBAR'] || File.expand_path("../_data/sidebars/picoruby_sidebar.yml", __FILE__)
      RBSDoc::Generator.new(
        steepfile: steepfile,
        output_dir: output_dir,
        sidebar_path: sidebar_path
      )
    end
  end
end
