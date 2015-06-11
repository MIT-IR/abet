require "rails_helper"

feature "User views list of subjects" do
  scenario "and only sees permitted subjects with assessments" do
    assessment = create(:direct_assessment)
    department = assessment.department
    permitted_subject = assessment.subject

    unpermitted_subject = create(:subject)
    create(:direct_assessment, subject: unpermitted_subject)

    subject_without_assessment = create(:subject, department_number: department.number)

    user = user_with_admin_access_to(department)

    visit root_path(as: user)
    click_on "Record Data"

    expect(page).to have_content permitted_subject.number
    expect(page).to have_content permitted_subject.title

    expect(page).not_to have_content unpermitted_subject.number
    expect(page).not_to have_content unpermitted_subject.title
    expect(page).not_to have_content subject_without_assessment.number
    expect(page).not_to have_content subject_without_assessment.title
  end
end
