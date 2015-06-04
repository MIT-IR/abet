require "spec_helper"

describe Permission do
  describe "#department_slug" do
    it "is derived from account" do
      account = double("Account", function: "foo", account_has_access_to: "bar")

      permission = Permission.from(account)

      expect(permission.department_slug).to eq account.account_has_access_to
    end
  end

  describe "#access_level" do
    it "is derived from account" do
      account = double("Account", function: "foo", account_has_access_to: "bar")

      permission = Permission.from(account)

      expect(permission.access_level).to eq account.function
    end
  end

  describe "#read?" do
    it "is true for the provided department if you have at least read" do
      department = Department.new(slug: "D_FOO")

      permission = Permission.new(
        department.slug,
        Permission::READ_ONLY
      )

      expect(permission.read?(department)).to eq true
    end

    it "is false if the permission is not for the department" do
      department = Department.new(slug: "D_FOO")

      permission = Permission.new("D_BAR", Permission::READ_ONLY)

      expect(permission.read?(department)).to eq false
    end
  end

  describe "#admin?" do
    it "is true for the provided department if user is an admin" do
      department = Department.new(slug: "D_BAR")

      permission = Permission.new(department.slug, Permission::ADMIN)

      expect(permission.admin?(department)).to eq true
    end

    it "is false if the user is an admin for a different department" do
      department = Department.new(slug: "D_BAR")

      permission = Permission.new("D_BAZ", Permission::ADMIN)

      expect(permission.admin?(department)).to eq false
    end

    it "is false if the user has non-admin access to the department" do
      department = Department.new(slug: "D_BAR")

      permission = Permission.new(department.slug, Permission::READ_ONLY)

      expect(permission.admin?(department)).to eq false
    end
  end
end
