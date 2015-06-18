require "rails_helper"

describe DirectAssessmentsController do
  describe "POST :create" do
    it "does not allow a user to create an assessment without permission" do
      outcome = create(:outcome)
      user = user_with_read_access_to(outcome.department)
      grant_access(user, create(:department), Permission::ASSESSMENTS)
      sign_in(user)

      expect {
        post :create,
        direct_assessment: assessment_params.merge(outcome_ids: [outcome.id])
      }.to raise_error(RuntimeError, "Not authorized")
      expect(DirectAssessment.count).to eq 0
    end
  end

  describe "PATCH :update" do
    it "does not allow a user to create an assessment without permission" do
      direct_assessment = create(:direct_assessment)
      course = create(:course, department: direct_assessment.department)
      outcome = create(:outcome, course: course)
      user = user_with_read_access_to(direct_assessment.department)
      grant_access(user, create(:department), Permission::ASSESSMENTS)
      sign_in(user)

      expect {
        patch :update,
        id: direct_assessment.id,
        direct_assessment: { outcome_ids: [outcome.id] }
      }.to raise_error(RuntimeError, "Not authorized")
    end
  end

  def assessment_params
    {
      description: "Math problem",
      minimum_requirement: "7 out of 10",
      name: "Quiz 1",
      problem_description: "hard math",
      subject_id: create(:subject).id,
      target_percentage: 75,
      outcome_ids: []
    }
  end
end
