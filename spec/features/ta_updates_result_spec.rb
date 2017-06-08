require "rails_helper"

feature "TA updates result" do
  scenario "for an assessment" do
    result = create(:result, percentage: 80)
    assignment = result.assignment
    user = user_with_results_access_to(assignment.subject_department)

    visit manage_results_subjects_path(as: user)
    click_on t("manage_results.subjects.show.view")
    click_on t("manage_results.assignments.results.edit")

    fill_in "Percentage", with: "90"
    click_on "Update Result"

    expect(page).to have_content "90%"
    expect(page).to have_content t("manage_results.results.update.success")
  end
end
