require "rails_helper"

feature "User updates other assessment" do
  scenario "other assessment is successfully updated" do
    assessment = create(:other_assessment, assessment_name: "Senior Thesis")
    outcome = assessment.outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#indirect_assessment-#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "indirect_assessment_assessment_name", with: "Freshman Thesis"
    click_on "Submit"

    within("#indirect_assessments") do
      expect(page).to have_content("Freshman Thesis")
    end
  end
end
