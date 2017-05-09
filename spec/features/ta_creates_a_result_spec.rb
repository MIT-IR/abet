require "rails_helper"

feature "TA creates a result" do
  scenario "for an assessment" do
    assessment = create(:assessment)
    department = assessment.department
    user = user_with_results_access_to(department)

    visit root_path(as: user)
    click_on "Record Data"

    expect(page).to have_content assessment.name
    expect(page).to have_content assessment.description
    expect(page).to have_content assessment.subject

    click_on "Add Result"

    expect(find_field("result_assessment_name").value).to eq assessment.name
    expect(find_field("result_assessment_description").value).to eq assessment.description
    expect(find_field("result_problem_description").value).to eq assessment.problem_description

    select "2015", from: "result_year"
    select "JA", from: "result_semester"
    fill_in "result_assessment_name", with: "Problem Set 2"
    fill_in "result_assessment_description", with: "Polynomial Equations"
    fill_in "result_problem_description", with: "Question 4"
    fill_in "result_percentage", with: "72"
    click_on "Create Result"

    expect(page).to have_content "2015"
    expect(page).to have_content "JA"
    expect(page).to have_content "Problem Set 2"
    expect(page).to have_content "Polynomial Equations"
    expect(page).to have_content "72"
  end
end
