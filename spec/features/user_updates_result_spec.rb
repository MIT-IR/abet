require "rails_helper"

feature "User updates result" do
  scenario "for a direct assessment" do
    result = create(:result, percentage: 80)
    assessment = result.assessment
    user = user_with_results_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Record Data"
    click_on assessment.subject
    click_on "View and Add Results"
    within("#result_#{result.id}") do
      click_on "Edit"
    end

    fill_in "Percentage", with: "90"
    click_on "Update Result"

    expect(page).to have_content "90%"
  end

  scenario "for an indirect assessment" do
    assessment = create(:survey)
    result = create(:result, assessment: assessment, percentage: 80)
    course = assessment.outcomes.first.course
    user = user_with_admin_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Manage Assessments"
    click_on "View Assessments"
    within("#indirect_assessment_#{assessment.id}") do
      click_on "View"
    end
    within("#result_#{result.id}") do
      click_on "Edit"
    end

    fill_in "Percentage", with: "90"
    click_on "Update Result"

    expect(page).to have_content "90%"
  end
end
