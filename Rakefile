require "fileutils"

task :default => :all

desc "Run all tasks"
task :all => ["steep_check", "rbs_doc:generate"]

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
  FileUtils.cd("picoruby") do
    sh "git checkout use-builtin-Task"
  end
  FileUtils.cd("lib") do
    sh "bundle install"
  end
end

directory MRUBYC_DIR do
  FileUtils.cd("picoruby/mrbgems/picoruby-mrubyc/repos") do
    sh "git clone https://github.com/mrubyc/mrubyc.git"
    FileUtils.cd("mrubyc") do
      sh "git checkout fix-picoruby-irb"
    end
  end
end

desc "Run jekyll"
task :s do
  sh "bundle exec jekyll serve"
end

desc "Run steep check"
task :steep_check do
  FileUtils.cd PICORUBY_DIR do
    sh "BUNDLE_GEMFILE=./Gemfile bundle exec rake steep"
  end
end

namespace :rbs_doc do
  desc "Generate documentation"
  task :generate do |t, args|
    work_dir = File.expand_path("../picoruby", __FILE__)
    steepfile = File.expand_path("../picoruby/Steepfile", __FILE__)
    output_dir = File.expand_path("../pages/rbs_doc", __FILE__)
    sidebar_path = File.expand_path("../_data/sidebars/picoruby_sidebar.yml", __FILE__)
    sh <<~CMD
      BUNDLE_GEMFILE=./lib/Gemfile \
      WORK_DIR=#{work_dir} \
      STEEPFILE=#{steepfile} \
      OUTPUT_DIR=#{output_dir} \
      SIDEBAR_PATH=#{sidebar_path} \
      bundle exec ruby lib/runner.rb
    CMD
  end
end
