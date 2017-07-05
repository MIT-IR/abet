require "rails_helper"

feature "User views attachment count and deletes an attachment from
  a coverage", js: true do
  scenario "successfully" do
    coverage = create(:coverage)
    attachment = create(:attachment, attachable: coverage)
    attachment_count = coverage.attachments.size
    subject_name = coverage.subject.title
    user = user_with_assignments_access_to(coverage.course.department)

    visit manage_assignments_course_path(coverage.course.id, as: user)

    within(".class-card-assignment-control") do
      expect(page).to have_content(attachment_count)
    end

    click_on t("manage_assignments.outcome_coverages.outcome_coverage.attachments-expandable-link")

    delete_attachment

    expect(page).to have_content(subject_name)
    expect(page).to have_no_content(attachment.file_file_name)
    expect(page).to have_content t("manage_assignments.coverages.coverage.attach-syllabus")

    within(".class-card-heading") do
      expect(page).to have_no_content t("manage_assignments.outcome_coverages.outcome_coverage.attachments-expandable-link")
    end
  end

  def delete_attachment
    within(".assignment-attachments") do
      click_on t("manage_assignments.shared.attachments.delete_link")
    end
  end
end
