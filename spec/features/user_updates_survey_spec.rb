require "rails_helper"

feature "User updates a survey assessment" do
  scenario "a survey assessment is successfully updated" do
    assessment = create(:survey, assessment_name: "Senior Survey")
    outcome = assessment.outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#indirect_assessment-#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "survey_assessment_name", with: "Freshman Survey"
    click_on "Submit"

    within("#indirect_assessments") do
      expect(page).to have_content("Freshman Survey")
    end
  end
end
