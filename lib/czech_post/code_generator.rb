module CzechPost
  module CodeGenerator
    def self.configuration
      @configuration ||= CzechPost::CodeGenerator::Configuration.new
    end

    def self.configure
      config = configuration
      yield(config)
    end
  end
end
