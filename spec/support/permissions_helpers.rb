module PermissionsHelpers
  def grant_access(user, departments, access_level)
    permissions = Array(departments).map do |department|
      Permission.new(department.slug, access_level)
    end

    allow(PermissionSet).to receive(:for).
      with(user.username).
      and_return(PermissionSet.new(permissions))
  end

  RSpec.configure do |config|
    config.include PermissionsHelpers, type: :feature
    config.include PermissionsHelpers, type: :controller
  end
end
