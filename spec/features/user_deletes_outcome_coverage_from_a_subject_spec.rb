require "rails_helper"

feature "User deletes an outcome coverage for a subject" do
  scenario "coverage has 2 or more outcome coverages" do
    course = create(:course)
    outcomes = create_pair(:outcome, course: course)
    coverage = create(:coverage, course: course, outcomes: outcomes)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course.id, as: user)
    first(".class-card-outcomes-wrapper").click_on("Delete")

    expect(page).to have_outcome_number_of(1)
  end

  scenario "coverage has 1 outcome coverage with associated assignments" do
    course = create(:course)
    outcome = create(:outcome, course: course)
    coverage = create(:coverage, course: course, outcomes: [outcome])
    outcome_coverage = OutcomeCoverage.first
    user = user_with_assessments_access_to(course.department)
    assignment = create(:assignment, outcome_coverage: outcome_coverage)
    coverage.outcome_coverages.first.update(assignment: assignment)

    visit manage_assessments_course_path(course.id, as: user)
    click_on "Delete"

    expect(page).to have_content(course.number)
    expect(page).to have_content t("manage_assessments.courses.show_without_coverages.no_classes", name: course.name)
    expect(page).to have_no_content(coverage.subject.title)
    expect(page).to have_no_content(outcome.nickname)
  end

  def have_outcome_number_of(count)
    have_css(".class-card-outcomes-wrapper", count: count)
  end
end
