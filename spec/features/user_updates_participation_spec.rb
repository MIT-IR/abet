require "rails_helper"

feature "User updates a participation assessment" do
  scenario "a participation assessment is successfully updated" do
    assessment = create(:participation, name: "UROP")
    outcome = assessment.outcomes.first
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#indirect_assessment-#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "indirect_assessment_name", with: "POUR"
    click_on "Update"

    within("#indirect_assessments") do
      expect(page).to have_content("POUR")
    end
  end
end
