require "net/ssh/kerberos"

server "outcomes",
  user: "root",
  roles: %w{app db web},
  ssh_options: {
    auth_methods: ["gssapi-with-mic"]
  }

set :rvm_type, :system
set :rvm_ruby_version, "2.2.2"
set :deploy_to, "/var/www/outcomes"
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
