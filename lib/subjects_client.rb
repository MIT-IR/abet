require_relative "subjects_client/configuration"
require_relative "subjects_client/adapters/cloudhub"
require_relative "subjects_client/adapters/fake"
require_relative "subjects_client/service_subject"

module SubjectsClient
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
