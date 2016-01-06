if Rails.env.development?
  RolesDb.configure do |config|
    config.mocked_account_list_file = Rails.root.join("config", "dev-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"
  end

  ENV["eppn"] ||= "daries@mit.edu"
end

RolesDb.configure do |config|
  config.ssl_cert_key_file = Rails.root.join("config", "certs", "outcomes-key.pem")
  config.ssl_cert_file = Rails.root.join("config", "certs", "outcomes.cer")
  config.ssl_ca_cert_file = Rails.root.join("config", "certs", "mit.pem")
  config.ssl_cert_key_password = "abetiscool"
  config.proxy_user_name = "abetuser"

  if Rails.env.test?
    config.mocked_account_list_file = Rails.root.join("config", "test-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"
  end

  if Rails.env.production? || Rails.env.staging?
    config.endpoint = "https://rolesws.mit.edu/rolesws/services/roles"
  end
end
