require "rails_helper"

feature "User creates an assessment" do
  scenario "the outcome description is displayed on the new assessment page" do
    create(:subject)
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)
    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    expect(page).to have_content(outcome.name)
    expect(page).to have_content(outcome.description)
  end

  scenario "a new assessment is created" do
    subject_title = create(:subject).title
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)
    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Grade from an assignment, quiz, or exam"

    fill_and_submit_form

    within("#direct_assessments") do
      expect(page).to have_content(subject_title)
    end
  end

  def fill_and_submit_form
    select first("#direct_assessment_subject_id option").text, from: "direct_assessment_subject_id"
    fill_in "direct_assessment_name", with: "Problem Set 1"
    fill_in "direct_assessment_description", with: "Integration"
    fill_in "direct_assessment_problem_description", with: "Integration by parts"
    fill_in "direct_assessment_minimum_grade", with: "7/10"
    fill_in "direct_assessment_target_percentage", with: 80
    click_on "Submit"
  end
end
