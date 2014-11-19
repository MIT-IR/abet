module RolesDb
  class LocalRoles
    def initialize
      mock_file = RolesDb.configuration.mocked_account_list_file
      if mock_file
        begin
        @accounts = parse_accounts(YAML.load_file(mock_file))
        rescue Exception => e
          puts e.inspect
        end
      end
    end

    def accounts_for(user)
      @accounts.find_all { |act| act.name == user }
    end

    private
    def parse_accounts(yaml)
      yaml.map do |act|
        account = act["account"]
        Account.new.tap do |a|
          a.authorization_id = account["authorization_id"]
          a.category = account["category"]
          a.effective_date = account["effective_date"]
          a.expiration_date = account["expiration_date"]
          a.function = account["function"]
          a.is_active_now = account["is_active_now"]
          a.name = account["name"]
          a.account_has_access_to = account["account_has_access_to"]
        end
      end
    end
  end
end
