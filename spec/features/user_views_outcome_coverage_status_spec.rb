require "rails_helper"

feature "user views outcome coverage status for a course" do
  scenario "sees which outcomes are covered and uncovered", js: true do
    course = create(:course)
    covered_outcome, uncovered_outcome = create_pair(:outcome, course: course)
    create(:coverage, course: course, outcomes: [covered_outcome])
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course, as: user)
    click_on "Unmatched Outcomes"

    expect(matched_outcome_cards).to have_content(covered_outcome.nickname)
    expect(unmatched_outcome_cards).to have_content(uncovered_outcome.nickname)
  end

  def matched_outcome_cards
    page.find(".outcome-card-matched")
  end

  def unmatched_outcome_cards
    page.find(".outcome-card-unmatched")
  end
end
