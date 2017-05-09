require "rails_helper"

feature "User updates an assessment" do
  scenario "successfully" do
    course = create(:course, :fully_aligned)
    outcome, other_outcome = create_pair(:outcome, course: course)
    assessment = create(:assessment, target_percentage: 50, outcomes: [outcome])
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(as: user)

    within("table.fully-aligned") do
      click_on "View Assessments"
    end

    within("#assessment_#{assessment.id}") do
      click_on "Edit"
    end

    check(other_outcome.to_s)
    fill_in "assessment_target_percentage", with: 85
    click_on "Submit"

    expect(page.find("#assessments")).to have_content assessment.subject
  end
end
