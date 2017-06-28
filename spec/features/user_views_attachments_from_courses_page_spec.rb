require "rails_helper"

feature "User views attachments related to a specific assignment", js: true do
  scenario "successfully" do
    assignment = create(:assignment)
    attachment = create(:attachment, attachable: assignment)
    user = user_with_assignments_access_to(assignment.course.department)

    visit manage_assignments_course_path(assignment.course.id, as: user)
    click_on t("manage_assignments.outcome_coverages.outcome_coverage.attachments-expandable-link")

    expect(page).to have_content(attachment.file_file_name)

    click_on t("manage_assignments.outcome_coverages.outcome_coverage.attachments-expandable-link")

    expect(page).to have_no_content(attachment.file_file_name)
  end
end
