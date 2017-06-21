require "rails_helper"

feature "User deletes a result" do
  scenario "from an assessment" do
    assignment = create(:assignment)
    result = create(:result, assignment: assignment)
    user = user_with_results_access_to(assignment.subject_department)

    visit manage_results_assignment_path(assignment, as: user)
    click_on t("manage_results.assignments.results.delete")

    expect(page).to have_content t("manage_results.results.destroy.success")
    expect(page).to have_content t("manage_results.assignments.results.no_results")
  end
end
