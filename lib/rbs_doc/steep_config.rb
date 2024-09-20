module RBSDoc
  class SteepConfig
    include Steep::Drivers::Utils::DriverHelper
    def initialize(steepfile)
      @config = load_config(path: Pathname(steepfile))
      @config.targets[0].signature_pattern.patterns << "mrbgems/picoruby-mrubyc/sig/"
    end
    attr_reader :config
  end
end
