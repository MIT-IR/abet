require "rails_helper"

feature "User creates a result" do
  scenario "and it is associated with a direct assessment" do
    assessment = create(:direct_assessment)
    user = user_with_admin_access_to(assessment.department)

    visit outcome_path(assessment.outcome, as: user)

    within("#direct_assessment-#{assessment.id}") do
      click_on "View and add results"
    end

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

  scenario "and it is associated with an indirect assessment" do
    assessment = create(:survey)
    user = user_with_admin_access_to(assessment.department)

    visit outcome_path(assessment.outcome, as: user)

    within("#indirect_assessment-#{assessment.id}") do
      click_on "View and add results"
    end

    click_on "Add result"

    select "2015", from: "result_year"
    fill_in "result_assessment_name", with: "Senior Survey"
    fill_in "result_assessment_description", with: "Annual survey"
    fill_in "result_percentage", with: "92"
    click_on "Submit"

    expect(page).to have_content "Senior Survey"
    expect(page).to have_content "Annual survey"
    expect(page).to have_content "92"
  end
end
