require "rails_helper"

feature "User views activity feed" do
  around do |example|
    PaperTrail.enabled = true
    PaperTrail.enabled_for_controller = true
    example.run
    PaperTrail.enabled_for_controller = false
    PaperTrail.enabled = false
  end

  scenario "sees recent results they have access to" do
    course = create(:course)
    subject = create(:subject, department: course.department)
    outcome = create(:outcome, course: course)
    coverage = create(:coverage, outcomes: [outcome], course: course, subject: subject)
    assignment = create(:assignment, outcome_coverage: coverage.outcome_coverages.first)
    result = create(:result, assignment: assignment)
    result.update(percentage: 50)
    other_department_result = create(:result)
    user = user_with_read_access_to(course.department)

    visit activities_path(as: user)

    expect(page).to have_content t("activities.outcome_coverage_activity.event.create_outcomecoverage_html",
                                    subject: subject)
    expect(page).to have_content t("activities.assignment_activity.event.create_assignment_html",
                                    name: assignment.name,
                                    subject: subject)
    expect(page).to have_content t("activities.result_activity.event.update_result_html",
                                    assignment: assignment.name,
                                    subject: subject)
    expect(page).to have_no_content t("activities.result_activity.event.create_result_html",
                                    assignment: other_department_result.assignment.name,
                                    subject: other_department_result.assignment.subject)
  end
end
