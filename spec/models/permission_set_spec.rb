require "spec_helper"

describe PermissionSet do
  describe ".for" do
    it "creates permission objects from the roles db" do
      username = "dprior"
      accounts = [
        fake_account("D_TEST1", Permission::ADMIN),
        fake_account("D_TEST2", Permission::READ_ONLY)
      ]
      allow(RolesDb.client).to receive(:accounts_for).
        with(username).
        and_return(accounts)

      permissions = PermissionSet.for(username)

      expect(permissions.count).to eq accounts.count
      expect(permissions.first).to be_an_instance_of(Permission)
      expect(permissions.last).to be_an_instance_of(Permission)
    end
  end

  describe "#department_slugs" do
    it "lists department slugs with abet access" do
      permission = instance_double(
        Permission,
        department_slug: "D_CHM",
        access_level: Permission::READ_ONLY
      )
      non_applicable_permission = instance_double(
        Permission,
        department_slug: "D_FOO",
        access_level: "DIFFERENT PERMISSION"
      )

      permissions = PermissionSet.new([permission, non_applicable_permission])

      expect(permissions.department_slugs).to eq [permission.department_slug]
    end

    it "optionally takes a permission level as an argument" do
      permission = instance_double(
        Permission,
        department_slug: "D_CHM",
        access_level: Permission::ASSESSMENTS
      )
      non_applicable_permission = instance_double(
        Permission,
        department_slug: "D_FOO",
        access_level: Permission::READ_ONLY
      )

      permissions = PermissionSet.new([permission, non_applicable_permission])
      department_slugs = permissions.department_slugs(Permission::MANAGE_ASSESSMENTS)

      expect(department_slugs).to eq [permission.department_slug]
    end
  end

  describe "#read?" do
    it "is true if delegating to any of the permissions returns true" do
      department = instance_double(Department)
      permission = instance_double(Permission, read?: true)

      permissions = PermissionSet.new([permission])

      expect(permissions.read?(department)).to eq true
    end

    it "is false otherwise" do
      department = instance_double(Department)
      permission = instance_double(Permission, read?: false)

      permissions = PermissionSet.new([permission])

      expect(permissions.read?(department)).to eq false
    end
  end

  describe "#admin?" do
    it "is true if delegating to any of the permissions returns true" do
      department = instance_double(Department)
      permission = instance_double(Permission, admin?: true)

      permissions = PermissionSet.new([permission])

      expect(permissions.admin?(department)).to eq true
    end

    it "is false otherwise" do
      department = instance_double(Department)
      permission = instance_double(Permission, admin?: false)

      permissions = PermissionSet.new([permission])

      expect(permissions.admin?(department)).to eq false
    end
  end

  describe "#manage_results?" do
    it "is true if delegating to any of the permissions returns true" do
      department = instance_double(Department)
      permission = instance_double(Permission, manage_results?: true)

      permissions = PermissionSet.new([permission])

      expect(permissions.manage_results?(department)).to eq true
    end

    it "is false otherwise" do
      department = instance_double(Department)
      permission = instance_double(Permission, manage_results?: false)

      permissions = PermissionSet.new([permission])

      expect(permissions.manage_results?(department)).to eq false
    end
  end

  describe "#manage_assessments?" do
    it "is true if delegating to any of the permissions returns true" do
      department = instance_double(Department)
      permission = instance_double(Permission, manage_assessments?: true)

      permissions = PermissionSet.new([permission])

      expect(permissions.manage_assessments?(department)).to eq true
    end

    it "is false otherwise" do
      department = instance_double(Department)
      permission = instance_double(Permission, manage_assessments?: false)

      permissions = PermissionSet.new([permission])

      expect(permissions.manage_assessments?(department)).to eq false
    end
  end

  def fake_account(department_slug, access_level)
    double(
      "Account",
      account_has_access_to: department_slug,
      function: access_level
    )
  end
end
