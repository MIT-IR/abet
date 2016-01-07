RolesDb.configure do |config|
  if Rails.env.development?
    config.mocked_account_list_file = Rails.root.join("config", "dev-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"

    ENV["eppn"] ||= "daries@mit.edu"
  end

  if Rails.env.test?
    config.mocked_account_list_file = Rails.root.join("config", "test-roles.yaml")
    config.strategy_class = "RolesDb::LocalRoles"
  end

  if Rails.env.staging?
    config.ssl_cert_key_file = Rails.root.join("config", "certs", "outcomes-dev-key.pem")
    config.ssl_cert_file = Rails.root.join("config", "certs", "outcomes-dev-cert.pem")
    config.ssl_ca_cert_file = Rails.root.join("config", "certs", "mit.pem")
    config.proxy_user_name = "abetuser"
    config.endpoint = "https://ws-test.mit.edu/rolesws/services/roles"
  end

  if Rails.env.production?
    config.ssl_cert_key_file = Rails.root.join("config", "certs", "outcomes-key.pem")
    config.ssl_cert_file = Rails.root.join("config", "certs", "outcomes.cer")
    config.ssl_ca_cert_file = Rails.root.join("config", "certs", "mit.pem")
    config.ssl_cert_key_password = "abetiscool"
    config.proxy_user_name = "abetuser"
    config.endpoint = "https://rolesws.mit.edu/rolesws/services/roles"
  end
end
