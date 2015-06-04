module PermissionsHelpers
  def grant_access(user, departments, access_level)
    permissions = Array(departments).map do |department|
      Permission.new(department.slug, access_level)
    end

    allow(PermissionSet).to receive(:for).
      with(user.username).
      and_return(PermissionSet.new(permissions))
  end

  def user_with_admin_access_to(department)
    create(:user).tap do |user|
      grant_access(user, department, Permission::ADMIN)
    end
  end

  def user_with_read_access_to(department)
    create(:user).tap do |user|
      grant_access(user, department, Permission::READ_ONLY)
    end
  end

  RSpec.configure do |config|
    config.include PermissionsHelpers, type: :feature
    config.include PermissionsHelpers, type: :controller
  end
end
