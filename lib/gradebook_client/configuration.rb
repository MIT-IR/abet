module GradebookClient
  class Configuration
    attr_accessor :adapter

    def initialize
      @adapter = Adapters::Fake.new
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

  def self.adapter
    configuration.adapter
  end
end
