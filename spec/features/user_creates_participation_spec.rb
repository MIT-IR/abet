require "rails_helper"

feature "User creates a participation assessment" do
  scenario "a new participation assessment is created" do
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)
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
    fill_in "participation_assessment_name", with: "UROP"
    fill_in "participation_assessment_description", with: "Undergraduate Resarch Projects"
    fill_in "participation_target_percentage", with: 80
    fill_in "participation_actual_percentage", with: 78
    click_on "Submit"
  end
end
