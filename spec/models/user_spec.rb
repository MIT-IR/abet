require "rails_helper"

describe User do
  describe "#username" do
    it "is extracted from the user's email address" do
      user = User.new(email: "dprior@mit.edu")

      expect(user.username).to eq "dprior"
    end
  end

  describe "#permissions" do
    it "is the permission set for the user" do
      user = User.new(email: "dprior@mit.edu")
      permissions = double("Permissions")
      allow(PermissionSet).to receive(:for).
        with(user.username).
        and_return(permissions)

      expect(user.permissions).to eq permissions
    end
  end

  describe "#departments" do
    it "returns the departments a user has permissions for" do
      permitted_department = create(:department)
      create(:department)

      user = User.new(email: "mgilman@mit.edu")
      permissions = double("Permissions", department_slugs: [permitted_department.slug])
      allow(PermissionSet).to receive(:for).
        with(user.username).
        and_return(permissions)

      expect(user.departments).to eq [permitted_department]
    end
  end
end
