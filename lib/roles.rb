class Roles
  def self.for(creds)
    krb_name = creds.split('@').first
    RolesDb.client.accounts_for(krb_name).map do |act|
      act.account_has_access_to
    end
  end
end
