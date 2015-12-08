require "rails_helper"

feature "User updates a participation assessment" do
  scenario "a participation assessment is successfully updated" do
    course = create(:course, :fully_aligned)
    outcome = create(:outcome, course: course)
    assessment = create(:participation, name: "UROP")
    assessment.outcomes << outcome
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(as: user)

    within("table.fully-aligned") do
      click_on "View Assessments"
    end

    within("#indirect_assessment_#{assessment.id}") do
      click_on "Edit"
    end

    fill_in "indirect_assessment_name", with: "POUR"
    click_on "Update"

    expect(page).to have_content("Assessment updated successfully.")
    expect(page).to have_content("POUR")
  end
end
