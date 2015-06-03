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
