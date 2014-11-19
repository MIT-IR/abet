module RolesDb
  class Configuration
    attr_accessor :ssl_version
    attr_accessor :ssl_verify_mode
    attr_accessor :ssl_cert_key_file
    attr_accessor :ssl_cert_file
    attr_accessor :ssl_ca_cert_file
    attr_accessor :ssl_cert_key_password

    attr_accessor :roles_wsdl_file

    attr_accessor :roles_category
    attr_accessor :is_active
    attr_accessor :will_expand
    attr_accessor :proxy_user_name
    attr_accessor :real_or_implied
    attr_accessor :function_name

    attr_accessor :strategy_class
    attr_accessor :mocked_account_list_file

    def initialize
      @is_active = 'true'
      @will_expand = 'true'
      @real_or_implied = 'B'
      @function_name = ''
      @strategy_class = "RolesDb::Roles"
    end
  end
end
