require "rails_helper"

feature "User creates custom outcomes" do
  scenario "user adds a custom outcome" do
    course = create(:course)
    associated_outcome, unassociated_outcome = create_pair(:standard_outcome)

    visit course_path(course)
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
  end
end
