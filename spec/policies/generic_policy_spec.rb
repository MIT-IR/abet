require "rails_helper"

describe GenericPolicy do
  include PermissionsHelpers

  describe "#create_assessments" do
    it "is true if the user manages assessments for courses with outcomes" do
      course = create(:outcome).course
      user = user_with_assessments_access_to(course.department)

      policy = GenericPolicy.new(user, nil)

      expect(policy.create_assessments?).to eq true
    end

    it "is false if the user manages assessments on courses without outcomes" do
      department = create(:course).department
      user = user_with_assessments_access_to(department)

      policy = GenericPolicy.new(user, nil)

      expect(policy.create_assessments?).to eq false
    end

    it "is false if the user is not an admin of any courses with outcomes" do
      course = create(:outcome).course
      user = user_with_read_access_to(course.department)

      policy = GenericPolicy.new(user, nil)

      expect(policy.create_assessments?).to eq false
    end
  end
end
