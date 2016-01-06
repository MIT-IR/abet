require "rails_helper"

describe "User filters course assessments" do
  scenario "by outcome" do
    course = create(:course)
    assessments = create_pair(:direct_assessment, course: course)
    outcomes = assessments.map { |assessment| assessment.outcomes.first }
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_assessments_path(course, as: user)

    select "Outcome #{outcomes.first.name.upcase}", from: "outcome_ids"
    click_button "Filter"

    within("#direct_assessments") do
      expect(page).to have_content assessments.first.to_s
      expect(page).not_to have_content assessments.last.to_s
    end

    select "Outcome #{outcomes.last.name.upcase}", from: "outcome_ids"
    click_button "Filter"

    within("#direct_assessments") do
      expect(page).not_to have_content assessments.first.to_s
      expect(page).to have_content assessments.last.to_s
    end
  end
end