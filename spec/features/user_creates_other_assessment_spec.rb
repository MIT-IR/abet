require "rails_helper"

feature "User creates other assessment" do
  scenario "a new assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit assessments_dashboard_path(as: user)
    find("[data-role='start-indirect-assessment']").click

    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Other"

    fill_and_submit_form

    within("#indirect_assessments") do
      expect(page).to have_content("Senior Thesis Completion")
      expect(page).to have_content("Other")
    end
  end

  def fill_and_submit_form
    fill_in "indirect_assessment_name", with: "Senior Thesis Completion"
    fill_in "indirect_assessment_description", with: "Percent of students who complete"
    fill_in "indirect_assessment_target_percentage", with: 80
    click_on "Submit"
  end
end
