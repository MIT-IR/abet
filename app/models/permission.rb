class Permission
  attr_reader :department_slug, :access_level

  def self.for(username)
    RolesDb.client.accounts_for(username).map do |account|
      Permission.new(account.account_has_access_to, account.function)
    end
  end

  def initialize(department_slug, access_level)
    @department_slug = department_slug
    @access_level = access_level
  end
end
