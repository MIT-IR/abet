GradebookClient.configure do |config|
  if Rails.env.production?
    config.adapter = GradebookClient::Adapters::LearningModules.new(
      endpoint: "https://learning-modules.mit.edu/service/gradebook/",
      client_cert: File.read("config/certs/outcomes-cert.pem"),
      client_key: File.read("config/certs/outcomes-key.pem"),
    )
  elsif Rails.env.development? && File.exists?("config/certs/outcomes-dev-cert.pem")
    config.adapter = GradebookClient::Adapters::LearningModules.new(
      endpoint: "https://learning-modules-dev.mit.edu:8443/service/gradebook/",
      client_cert: File.read("config/certs/outcomes-dev-cert.pem"),
      client_key: File.read("config/certs/outcomes-dev-key.pem"),
    )
  else
    config.adapter = GradebookClient::Adapters::Fake.new
  end
end
