module RBSDoc
  class SteepConfig
    include Steep::Drivers::Utils::DriverHelper
    def initialize(steepfile)
      @config = load_config(path: Pathname(steepfile))
    end
    attr_reader :config
  end
end
