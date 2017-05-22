require_relative "gradebook_client/configuration"
require_relative "gradebook_client/adapters/learning_modules"
require_relative "gradebook_client/adapters/fake"
require_relative "gradebook_client/gradebook_assignment"
require_relative "gradebook_client/gradebook"
require_relative "gradebook_client/histogram"
require_relative "gradebook_client/histogram_bar"
require_relative "gradebook_client/error"

module GradebookClient
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
