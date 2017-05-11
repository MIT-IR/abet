require "rails_helper"

feature "User creates an assessment" do
  scenario "a new assessment is created" do
    subject_ = create(:subject)
    course = create(:course)
    outcomes = create_pair(:outcome, course: course)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_root_path(as: user)
    click_link t("helpers.create_new_assessment")

    outcomes.each { |outcome| check(outcome.to_s) }
    fill_and_submit_form
    click_link course.name

    expect(page).to have_content subject_
    expect(page).to have_content "Problem Set 1"
  end

  def fill_and_submit_form
    select all("#assessment_subject_id option").last.text, from: "assessment_subject_id"
    fill_in "assessment_name", with: "Problem Set 1"
    fill_in "assessment_description", with: "Integration"
    fill_in "assessment_problem_description", with: "Integration by parts"
    fill_in "assessment_minimum_requirement", with: "7/10"
    fill_in "assessment_target_percentage", with: 80
    click_on "Submit"
  end
end
