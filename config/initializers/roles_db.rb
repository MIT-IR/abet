if Rails.env.development?
  RolesDb.configure do |config|
    config.mocked_account_list_file = Rails.root.join("config", "dev-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"
  end

  ENV["eppn"] ||= "daries@mit.edu"
end

if Rails.env.test?
  RolesDb.configure do |config|
    config.mocked_account_list_file = Rails.root.join("config", "test-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"
  end
end

RolesDb.configure do |config|
  config.ssl_cert_key_file = Rails.root.join("config", "certs", "outcomes-key.pem")
  config.ssl_cert_file = Rails.root.join("config", "certs", "outcomes.cer")
  config.ssl_ca_cert_file = Rails.root.join("config", "certs", "mit.pem")
  config.roles_wsdl_file = Rails.root.join("config", "certs", "roles.wsdl")
  config.ssl_cert_key_password = "abetiscool"
  config.proxy_user_name = "abetuser"
end
