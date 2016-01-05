module GradebookClient
  class Configuration
    attr_accessor :adapter

    def initialize
      @adapter = Adapters::Fake.new
    end
  end
end
