require "rails_helper"

feature "User creates a participation assessment" do
  scenario "a new participation assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit assessments_dashboard_path(as: user)
    click_on "By Course"

    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Participation in program"

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
    click_on "Submit"
  end
end
