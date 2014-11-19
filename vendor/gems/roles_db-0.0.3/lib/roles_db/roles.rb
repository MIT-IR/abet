module RolesDb
  class Roles

    attr_reader :client, :ssl_options

    def initialize
      @client = nil

      @ssl_options = {
        ssl_version: :TLSv1,
        ssl_verify_mode: :none,
        ssl_cert_key_file: RolesDb.configuration.ssl_cert_key_file,
        ssl_cert_file: RolesDb.configuration.ssl_cert_file,
        ssl_ca_cert_file: RolesDb.configuration.ssl_ca_cert_file,
        ssl_cert_key_password: RolesDb.configuration.ssl_cert_key_password
      }

      File.open(RolesDb.configuration.roles_wsdl_file, "r"){|f|
        options = ssl_options.merge({wsdl: f})
        @client = Savon.client(options)
      }
    end

    def accounts_for(user)
      begin
      call_options = {
                      :UserName => user,
                      :category => RolesDb.configuration.roles_category,
                      :isActive => RolesDb.configuration.is_active,
                      :willExpand => RolesDb.configuration.will_expand,
                      :proxyUserName => RolesDb.configuration.proxy_user_name,
                      :realOrImplied => RolesDb.configuration.real_or_implied,
                      :function_name => RolesDb.configuration.function_name,
                      :function_id => '',
                      :function_qualifier_type => '',
                      :qualifier_code => '',
                      :qualifier_id => '',
                      :base_qual_code => '',
                      :base_qual_id => '',
                      :parent_qual_code => '',
                      :parend_qual_id => '',
                     }
      response = @client.call(:list_auth_by_person_extend1, message: call_options)
      accounts = response.body[:list_auth_by_person_extend1_response][:list_auth_by_person_extend1_return]
      rescue Exception => e
        puts e
      end
      return [] if accounts.nil?
      if accounts.respond_to?(:keys) #is this a hash or array?
         #the xml returns a hash if only one result, an array otherwise
         [map_xml_to_account(accounts)]
      else
        accounts.uniq.each_with_index.map do |account, i|
          map_xml_to_account(account)
        end
      end
    end

    def map_xml_to_account(account)
        a = RolesDb::Account.new
        a.authorization_id = account[:authorization_id]
        a.category = account[:category]
        a.effective_date = account[:effective_date]
        a.expiration_date = account[:expiration_date]
        a.function = account[:function]
        a.is_active_now = account[:is_active_now]
        a.name = account[:name]
        a.account_has_access_to = account[:qualifier_code]
        a
    end
  end
end
