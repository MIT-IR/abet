require "rails_helper"

feature "User updates other assessment" do
  scenario "other assessment is successfully updated" do
    course = create(:course, :fully_aligned)
    outcome = create(:outcome, course: course)
    assessment = create(:other_assessment, name: "Senior Thesis")
    assessment.outcomes << outcome
    user = user_with_admin_access_to(course.department)

    visit outcomes_dashboard_path(as: user)

    within("table.fully-aligned") do
      click_on "Edit Assessments"
    end

    within("#indirect_assessment_#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "indirect_assessment_name", with: "Freshman Thesis"
    click_on "Update"

    within("#indirect_assessments") do
      expect(page).to have_content("Freshman Thesis")
    end
  end
end
