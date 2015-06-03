require "rails_helper"

feature "User creates custom outcomes" do
  scenario "adds first custom outcome" do
    course = create(:course)
    associated_outcome, unassociated_outcome = create_pair(:standard_outcome)
    user = create(:user)
    grant_access(user, course.department, Permission::ADMIN)

    visit course_path(course, as: user)
    click_on "Create Custom Outcomes"

    fill_in "outcome_name", with: "A.1.a"
    fill_in "outcome_description", with: "Ability to solve complex problems"

    select "High alignment", from: associated_outcome.description
    click_on "Submit"

    expect(page).to have_content("A.1.a")
    expect(page).to have_content("Ability to solve complex problems")

    within("#unassociated-outcomes") do
      expect(page).to have_content(unassociated_outcome.description)
      expect(page).not_to have_content(associated_outcome.description)
    end

    click_on "Details"

    within("#outcome_alignments") do
      expect(page).to have_content(associated_outcome.description)
      expect(page).to have_content("High alignment")
    end
  end

  scenario "adds additional custom outcome" do
    standard_outcome = create(:standard_outcome)
    course = create(:course, has_custom_outcomes: true)
    custom_outcome = create(:outcome, course: course)
    user = create(:user)
    grant_access(user, course.department, Permission::ADMIN)

    visit course_path(course, as: user)

    expect(page).to have_content(custom_outcome.name)
    expect(page).to have_content(custom_outcome.description)

    click_on "New custom outcome"

    fill_in "outcome_name", with: "A.1.b"
    fill_in "outcome_description", with: "Ability to solve simple problems"

    select "Moderate alignment", from: standard_outcome.description
    click_on "Submit"

    expect(page).to have_content("A.1.b")
    expect(page).to have_content("Ability to solve simple problems")
  end
end
