require "rails_helper"

feature "User deletes a result" do
  scenario "from a direct assessment" do
    result = create(:result)
    assessment = result.assessment
    user = user_with_results_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Record Data"
    click_on "View"
    within("#result_#{result.id}") do
      click_on "Delete"
    end

    expect(page).to have_content "Result deleted"
    expect(page).not_to have_content result.assessment_name
  end

  scenario "from an indirect assessment" do
    assessment = create(:survey)
    result = create(:result, assessment: assessment)
    course = assessment.outcomes.first.course
    user = user_with_admin_access_to(assessment.department)

    visit root_path(as: user)
    click_on "Manage Assessments"
    within("#indirect_assessment_#{assessment.id}") do
      click_on "View"
    end
    within("#result_#{result.id}") do
      click_on "Delete"
    end

    expect(page).to have_content "Result deleted"
    expect(page).not_to have_content result.assessment_name
  end
end
