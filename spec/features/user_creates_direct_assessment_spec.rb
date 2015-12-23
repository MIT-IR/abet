require "rails_helper"

feature "User creates a direct assessment" do
  scenario "a new assessment is created" do
    subject_ = create(:subject)
    course = create(:course)
    outcomes = create_pair(:outcome, course: course)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_root_path(as: user)
    find("[data-role='start-direct-assessment']").click

    outcomes.each { |outcome| check(outcome.to_s) }
    fill_and_submit_form
    click_link course.name

    within "#direct_assessments" do
      expect(page).to have_content subject_
      expect(page).to have_content "Problem Set 1"
    end
  end

  def fill_and_submit_form
    select all("#direct_assessment_subject_id option").last.text, from: "direct_assessment_subject_id"
    fill_in "direct_assessment_name", with: "Problem Set 1"
    fill_in "direct_assessment_description", with: "Integration"
    fill_in "direct_assessment_problem_description", with: "Integration by parts"
    fill_in "direct_assessment_minimum_requirement", with: "7/10"
    fill_in "direct_assessment_target_percentage", with: 80
    click_on "Submit"
  end
end
