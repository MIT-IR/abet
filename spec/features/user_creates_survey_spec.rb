require "rails_helper"

feature "User creates a survey assessment" do
  scenario "a new survey assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)
    within("#outcome-#{outcome.id}") do
      click_on "Add new assessment"
    end

    click_on "Survey results"

    fill_and_submit_form

    within("#indirect_assessments") do
      expect(page).to have_content("Senior Survey")
      expect(page).to have_content("Survey")
    end
  end

  def fill_and_submit_form
    fill_in "survey_assessment_name", with: "Senior Survey"
    fill_in "survey_assessment_description", with: "Biennial survey"
    fill_in "survey_survey_question", with: "How satisfied are you?"
    fill_in "survey_minimum_category", with: "Somewhat satisfied"
    fill_in "survey_target_percentage", with: 80
    fill_in "survey_actual_percentage", with: 78
    click_on "Submit"
  end
end
