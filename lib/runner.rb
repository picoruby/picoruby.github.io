require_relative 'rbs_doc'
require 'fileutils'

FileUtils.cd ENV['WORK_DIR'] do
  RBSDoc::Generator.new(
    steepfile: ENV['STEEPFILE'],
    output_dir: ENV['OUTPUT_DIR'],
    sidebar_path: ENV['SIDEBAR_PATH']
  )
end
