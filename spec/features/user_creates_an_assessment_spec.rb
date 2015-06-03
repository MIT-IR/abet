require "rails_helper"

feature "User creates an assessment" do
  scenario "the outcome description is displayed on the new assessment page" do
    outcome = create(:outcome)
    user = create(:user)
    grant_access(user, outcome.course.department, Permission::ADMIN)

    visit course_path(outcome.course, as: user)
    within("#outcome-#{outcome.id}") do
      click_on "Add new assessment"
    end

    expect(page).to have_content(outcome.name)
    expect(page).to have_content(outcome.description)
  end

  scenario "a new assessment is created" do
    outcome = create(:outcome)
    user = create(:user)
    grant_access(user, outcome.course.department, Permission::ADMIN)

    visit course_path(outcome.course, as: user)
    within("#outcome-#{outcome.id}") do
      click_on "Add new assessment"
    end

    click_on "Grade from an assignment, quiz, or exam"

    fill_and_submit_form

    within("#direct_assessments") do
      expect(page).to have_content("Calculus")
    end
  end

  def fill_and_submit_form
    fill_in "direct_assessment_subject_number", with: "18.01"
    fill_in "direct_assessment_subject_description", with: "Calculus"
    fill_in "direct_assessment_assignment_name", with: "Problem Set 1"
    fill_in "direct_assessment_assignment_description", with: "Integration"
    fill_in "direct_assessment_problem_description", with: "Integration by parts"
    fill_in "direct_assessment_minimum_grade", with: "7/10"
    fill_in "direct_assessment_target_percentage", with: 80
    fill_in "direct_assessment_actual_percentage", with: 78
    click_on "Submit"
  end
end
