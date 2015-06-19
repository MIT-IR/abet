require "rails_helper"

feature "User creates a survey assessment" do
  scenario "a new survey assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit manage_assessments_root_path(as: user)
    find("[data-role='start-indirect-assessment']").click

    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Create Survey Assessment"

    fill_and_submit_form

    expect(page).to have_content("Assessment created successfully.")
    expect(page).to have_content("Senior Survey")
    expect(page).to have_content("Survey")
  end

  def fill_and_submit_form
    fill_in "indirect_assessment_name", with: "Senior Survey"
    fill_in "indirect_assessment_description", with: "Biennial survey"
    fill_in "indirect_assessment_survey_question", with: "How satisfied are you?"
    fill_in "indirect_assessment_minimum_requirement", with: "Somewhat satisfied"
    fill_in "indirect_assessment_target_percentage", with: 80
    click_on "Create Indirect Assessment"
  end
end
