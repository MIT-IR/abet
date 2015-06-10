require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Abet
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.middleware.use Rack::Deflater
  end
  RolesDb.configure do |config|
    config.ssl_cert_key_file = Rails.root.join("config", "certs", "outcomes-key.pem")
    config.ssl_cert_file = Rails.root.join("config", "certs", "outcomes.cer")
    config.ssl_ca_cert_file = Rails.root.join("config", "certs", "mit.pem")
    config.roles_wsdl_file = Rails.root.join("config", "certs", "roles.wsdl")
    config.ssl_cert_key_password = "abetiscool"
    config.proxy_user_name = 'abetuser'
  end
end
