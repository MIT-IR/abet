require "rails_helper"

describe DefaultOutcomesController do
  describe "POST :create" do
    it "does not allow adoption of default outcomes when outcomes exist" do
      course = create(:outcome).course
      create(:standard_outcome)
      user = user_with_admin_access_to(course.department)
      sign_in(user)

      post :create, course_id: course.id

      expect(course.outcomes.count).to eq 1
    end
  end
end
