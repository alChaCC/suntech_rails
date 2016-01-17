require "suntech_rails/engine"
module SuntechRails
  module Core
    autoload :VERSION,        "suntech_rails/core/version"
    autoload :Config,         "suntech_rails/core/config"
    autoload :Configuration,  "suntech_rails/core/config"
    autoload :Logging,        "suntech_rails/core/logging"
    autoload :Exceptions,     "suntech_rails/core/exceptions"
  end

  class << self
    def configure(options = {}, &block)
      Core::Config.configure(options, &block)
    end

    def load(*args)
      Core::Config.load(*args)
    end

    def logger
      Core::Config.logger
    end

    def logger=(log)
      Core::Config.logger = log
    end
  end
end