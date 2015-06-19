require "rails_helper"

feature "User creates a participation assessment" do
  scenario "a new participation assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit manage_assessments_root_path(as: user)
    find("[data-role='start-indirect-assessment']").click

    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Create Participation Assessment"

    fill_and_submit_form

    within("#indirect_assessments") do
      expect(page).to have_content("UROP")
      expect(page).to have_content("Program Participation")
    end
  end

  def fill_and_submit_form
    fill_in "indirect_assessment_name", with: "UROP"
    fill_in "indirect_assessment_description", with: "Undergraduate Resarch Projects"
    fill_in "indirect_assessment_target_percentage", with: 80
    fill_in "indirect_assessment_minimum_requirement", with: "Pass"
    click_on "Create Indirect Assessment"
  end
end
