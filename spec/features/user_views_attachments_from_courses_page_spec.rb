require "rails_helper"

feature "User views attachments related to a specific assignment", js: true do
  scenario "successfully" do
    assignment = create(:assignment)
    attachment = create(:attachment, attachable: assignment)
    user = user_with_assignments_access_to(assignment.course.department)

    visit manage_assignments_course_path(assignment.course.id, as: user)
    click_on "Attachments"

    expect(page).to have_content(attachment.file_file_name)

    click_on "Attachments"

    expect(page).to have_no_content(attachment.file_file_name)
  end

  scenario "deletes" do
    assignment = create(:assignment)
    attachment = create(:attachment, attachable: assignment)
    user = user_with_assignments_access_to(assignment.course.department)

    visit manage_assignments_course_path(assignment.course.id, as: user)
    click_on "Attachments"
    save_and_open_page
    within("table.assignment-attachments") do
      click_on "Delete"
    end

    expect(page).to have_no_content(attachment.file_file_name)
  end
end
