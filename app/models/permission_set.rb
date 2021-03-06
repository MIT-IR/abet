class PermissionSet
  include Enumerable

  attr_reader :permissions
  delegate :each, :last, to: :permissions

  def self.for(username)
    permissions = RolesDb.client.accounts_for(username).map do |account|
      Permission.from(account)
    end

    new(permissions)
  end

  def initialize(permissions)
    @permissions = Array(permissions)
  end

  def department_slugs(access_levels = Permission::ALL)
    each_with_object([]) do |permission, slugs|
      if access_levels.include?(permission.access_level)
        slugs << permission.department_slug
      end
    end
  end

  def read?(department)
    any? { |permission| permission.read?(department) }
  end

  def manage_results?(department)
    any? { |permission| permission.manage_results?(department) }
  end

  def manage_assignments?(department)
    any? { |permission| permission.manage_assignments?(department) }
  end

  def admin?(department)
    any? { |permission| permission.admin?(department) }
  end
end
