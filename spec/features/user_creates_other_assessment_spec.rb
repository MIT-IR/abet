require "rails_helper"

feature "User creates other assessment" do
  scenario "a new assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit manage_assessments_root_path(as: user)
    find("[data-role='start-indirect-assessment']").click

    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Other"

    fill_and_submit_form

    expect(page).to have_content("Assessment created successfully.")
    expect(page).to have_content("Senior Thesis Completion")
  end

  def fill_and_submit_form
    fill_in "indirect_assessment_name", with: "Senior Thesis Completion"
    fill_in "indirect_assessment_description", with: "Percent of students who complete"
    fill_in "indirect_assessment_target_percentage", with: 80
    fill_in "indirect_assessment_minimum_requirement", with: "Pass"
    click_on "Create Indirect Assessment"
  end
end
