require "rails_helper"

feature "User adds assignment to outcome coverage" do
  scenario "successfully" do
    outcome = create(:outcome)
    course = outcome.course
    coverage = create(:coverage, course: course, outcomes: [outcome])
    user = user_with_assignments_access_to(course.department)

    visit manage_assignments_course_path(course.id, as: user)

    expect(page).to have_content(course.name)
    expect(page).to have_content(course.number)

    click_on t("manage_assignments.outcome_coverages.outcome_coverage.add_assignment")
    fill_in :assignment_name, with: "Problem Set 2"
    fill_in :assignment_problem, with: "Question 4"
    click_on t("helpers.submit.coverage.create")

    expect(page).to have_content(course.name)
    expect(page).to have_content(course.number)

    within("#matched_outcomes") do
      expect(page).to have_content("Problem Set 2")
      expect(page).to have_content("Question 4")
    end
  end
end
