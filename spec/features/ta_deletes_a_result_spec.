require "rails_helper"

feature "User deletes a result" do
  scenario "from an assessment" do
    result = create(:result)
    assessment = result.assessment
    user = user_with_results_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Record Data"
    click_on t("manage_results.subjects.show.view")
    within("#result_#{result.id}") do
      click_on t("manage_results.assessments.results.delete")
    end

    expect(page).to have_content t("manage_results.results.destroy.success")
    expect(page).not_to have_content result.assessment_name
  end
end
