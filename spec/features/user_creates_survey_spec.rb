require "rails_helper"

feature "User creates a survey assessment" do
  scenario "a new survey assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)
    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Survey results"

    fill_and_submit_form

    within("#indirect_assessments") do
      expect(page).to have_content("Senior Survey")
      expect(page).to have_content("Survey")
    end
  end

  def fill_and_submit_form
    fill_in "indirect_assessment_assessment_name", with: "Senior Survey"
    fill_in "indirect_assessment_assessment_description", with: "Biennial indirect_assessment"
    fill_in "indirect_assessment_survey_question", with: "How satisfied are you?"
    fill_in "indirect_assessment_minimum_category", with: "Somewhat satisfied"
    fill_in "indirect_assessment_target_percentage", with: 80
    fill_in "indirect_assessment_actual_percentage", with: 78
    click_on "Submit"
  end
end
