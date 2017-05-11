require "rails_helper"

feature "User updates result" do
  scenario "for an assessment" do
    result = create(:result, percentage: 80)
    assessment = result.assessment
    user = user_with_results_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Record Data"
    click_on t("manage_results.subjects.show.view")
    within("#result_#{result.id}") do
      click_on t("manage_results.assessments.results.edit")
    end

    fill_in "Percentage", with: "90"
    click_on "Update Result"

    expect(page).to have_content "90%"
    expect(page).to have_content t("manage_results.results.update.success")
  end
end
