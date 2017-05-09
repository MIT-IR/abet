require "rails_helper"

feature "User updates result" do
  scenario "for an assessment" do
    result = create(:result, percentage: 80)
    assessment = result.assessment
    user = user_with_results_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Record Data"
    click_on "View"
    within("#result_#{result.id}") do
      click_on "Edit"
    end

    fill_in "Percentage", with: "90"
    click_on "Update Result"

    expect(page).to have_content "90%"
  end
end
