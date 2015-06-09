require "rails_helper"

feature "User updates a direct assessment" do
  scenario "a direct assessment is successfully updated" do
    assessment = create(:direct_assessment, target_percentage: 50)
    outcome = assessment.outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#direct_assessment-#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "direct_assessment_target_percentage", with: 85
    click_on "Submit"

    within("#direct_assessments") do
      expect(page).to have_content("85")
    end
  end
end
