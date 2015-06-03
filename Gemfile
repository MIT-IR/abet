source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "~> 4.2.0"
gem "compass-rails"
gem "coffee-rails"
gem "email_validator"
gem "jquery-rails"
gem "pg"
gem "pundit"
gem "sass-rails"
gem "roles_db", "0.0.3", path: "vendor/gems/roles_db-0.0.3"
gem "savon"
gem "therubyracer"
gem "turbolinks"
gem "uglifier"
gem "zurb-foundation"

group :development do
  gem "capistrano-rails"
  gem "capistrano-rvm"
  gem "gssapi", git: "git@github.com:derekprior/gssapi.git"
  gem "net-ssh-krb"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails"
end
