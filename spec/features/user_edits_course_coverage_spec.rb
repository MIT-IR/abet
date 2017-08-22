require "rails_helper"

feature "User edits course coverage" do
  scenario "by adding another outcome successfully" do
    subject = create(:subject)
    covered_outcome = create(:outcome)
    coverage = create(:coverage, course: covered_outcome.course, outcomes: [covered_outcome], subject: subject)
    uncovered_outcome = create(:outcome, course: coverage.course)
    user = user_with_assignments_access_to(coverage.department)

    visit manage_assignments_course_path(coverage.course_id, as: user)
    click_on t("manage_assignments.coverages.coverage.add_another_outcome", subject_number: coverage.subject.number)

    expect(page).to have_no_option_for(covered_outcome)
    expect(page).to have_option_for(uncovered_outcome)

    click_on "Update"

    expect(page).to have_content(covered_outcome.nickname)
    expect(page).to have_content(uncovered_outcome.nickname)
  end

  scenario "by removing an unpersisted outcome", js: true do
    subject = create(:subject)
    coverage = create(:coverage, subject: subject)
    outcome = create(:outcome, course: coverage.course)
    user = user_with_assignments_access_to(coverage.department)

    visit manage_assignments_course_path(coverage.course, as: user)
    click_on t("manage_assignments.coverages.coverage.add_another_outcome", subject_number: coverage.subject.number)
    click_on t("manage_assignments.coverages.form.add_outcome")
    selectize outcome.nickname, from: "Outcome"
    click_on t("manage_assignments.coverages.outcome_coverage_fields.remove")

    expect(page).not_to have_content(outcome.nickname)
  end

  def have_no_option_for(outcome)
    have_no_css("option", text: outcome.nickname)
  end

  def have_option_for(outcome)
    have_css("option", text: outcome.nickname)
  end
end
