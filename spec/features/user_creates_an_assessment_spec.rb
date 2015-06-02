require "rails_helper"

feature "User creates an assessment" do
  scenario "the outcome description is displayed on the new assessment page" do
    outcome = create(:outcome)

    visit course_path(outcome.course)
    within("#outcome-#{outcome.id}") do
      click_on "Add new assessment"
    end

    expect(page).to have_content(outcome.name)
    expect(page).to have_content(outcome.description)
  end
end
