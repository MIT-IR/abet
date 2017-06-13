SubjectsClient.configure do |config|
  client_id = Rails.application.secrets.subjects_client_id
  secret = Rails.application.secrets.subjects_client_secret

  if client_id && secret
    config.adapter = SubjectsClient::Adapters::Cloudhub.new(
      id: client_id,
      secret: secret
    )
  end
end
