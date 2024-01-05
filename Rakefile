require "fileutils"
require_relative "./vendor/gems/steep-1.6.0/lib/steep"
load File.expand_path("../submodules/rbs_doc/tasks/rbs_doc.rake", __FILE__)

task :default => :all

desc "Run all tasks"
task :all => ["rbs_doc:generate"]

desc "Setup"
task :setup => [:vendor, :submodule]
task :vendor do
  sh "bundle install --path ./vendor/ steep"
end

PICORUBY_DIR = "submodules/picoruby"
MRUBYC_DIR = "submodules/picoruby/mrbgems/picoruby-mrubyc/repos/mrubyc"

desc "Update submodule"
task :submodule => [PICORUBY_DIR, MRUBYC_DIR]

directory PICORUBY_DIR do
  FileUtils.cd("submodules") do
    sh "git clone https://github.com/picoruby/picoruby.git"
  end
end

directory MRUBYC_DIR do
  FileUtils.cd("submodules/picoruby/mrbgems/picoruby-mrubyc/repos") do
    sh "git clone https://github.com/mrubyc/mrubyc.git"
  end
end

desc "Run jekyll"
task :s do
  sh "bundle exec jekyll serve"
end

