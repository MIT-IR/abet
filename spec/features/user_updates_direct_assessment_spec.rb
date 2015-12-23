require "rails_helper"

feature "User updates a direct assessment" do
  scenario "a direct assessment is successfully updated" do
    course = create(:course, :fully_aligned)
    outcome, other_outcome = create_pair(:outcome, course: course)
    assessment = create(:direct_assessment, target_percentage: 50, outcomes: [outcome])
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(as: user)

    within("table.fully-aligned") do
      click_on "View Assessments"
    end

    within("#direct_assessment_#{assessment.id}") do
      click_on "Edit"
    end

    check(other_outcome.to_s)
    fill_in "direct_assessment_target_percentage", with: 85
    click_on "Submit"

    expect(page.find("#direct_assessments")).to have_content assessment.subject
  end
end
