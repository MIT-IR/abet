require "rails_helper"

feature "User views attachments related to a specific coverage" do
  scenario "coverage has an attachment" do
    coverage = create(:coverage)
    attachment = create(:attachment, attachable: coverage)
    user = user_with_assignments_access_to(coverage.course_department)

    visit manage_assignments_course_path(coverage.course.id, as: user)

    expect(page).to have_content attachment.file_file_name
  end

  scenario "coverage does not have an attachment" do
    coverage = create(:coverage)
    user = user_with_assignments_access_to(coverage.course_department)

    visit manage_assignments_course_path(coverage.course.id, as: user)

    expect(page). to have_content t("manage_assignments.coverages.coverage.attach-syllabus")
  end
end
