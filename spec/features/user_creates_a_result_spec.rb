require "rails_helper"

feature "User creates a result" do
  scenario "and it is associated with an assessment" do
    assessment = create(:direct_assessment)
    user = user_with_admin_access_to(assessment.department)

    visit direct_assessment_path(assessment, as: user)

    click_on "Add result"

    select "2015", from: "result_year"
    select "JA", from: "result_semester"
    fill_in "result_assessment_name", with: "Problem Set 2"
    fill_in "result_assessment_description", with: "Polynomial Equations"
    fill_in "result_problem_description", with: "Question 4"
    fill_in "result_percentage", with: "72"
    click_on "Submit"

    expect(page).to have_content "Problem Set 2"
    expect(page).to have_content "Polynomial Equations"
    expect(page).to have_content "72"
  end
end
