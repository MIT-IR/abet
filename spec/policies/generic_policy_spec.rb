require "rails_helper"

describe GenericPolicy do
  include PermissionsHelpers

  describe "#create_assessments" do
    it "is true if the user is an admin for any department" do
      department = instance_double(Department, slug: "Foo")
      user = user_with_admin_access_to(department)

      policy = GenericPolicy.new(user, nil)

      expect(policy.create_assessments?).to eq true
    end

    it "is false otherwise" do
      department = instance_double(Department, slug: "Foo")
      user = user_with_read_access_to(department)

      policy = GenericPolicy.new(user, nil)

      expect(policy.create_assessments?).to eq false
    end
  end
end
