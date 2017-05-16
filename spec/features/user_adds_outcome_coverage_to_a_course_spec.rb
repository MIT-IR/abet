require "rails_helper"

feature "user adds outcome coverage to a course" do
  scenario "successfully" do
    subject = create(:subject)
    course = create(:course)
    outcome = create(:outcome, course: course)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_outcome_coverages_path(course, as: user)
    click_on "Add a class"
    select subject.title, from: "outcome_coverage[subject_id]"
    select outcome.nickname, from: "outcome_coverage[outcome_id]"
    click_button "Add"

    within("#matched_outcomes") do
      expect(page).to have_content(subject.title)
      expect(page).to have_content(outcome.nickname)
    end
  end
end
