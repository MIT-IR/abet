require "rails_helper"

feature "Admin creates custom outcomes" do
  scenario "successfully" do
    standard_outcome = create(:standard_outcome)
    course = create(:course)
    user = user_with_admin_access_to(course.department)
    description = "Can read good"

    visit manage_outcomes_root_path(as: user)
    click_link "Create Custom Outcome"
    fill_in "Label", with: "X"
    fill_in "Description", with: description
    fill_in "Nickname", with: "Nickname"
    select Alignment::LEVELS.first, from: standard_outcome
    click_on "Create Outcome"

    expect(page).to have_text description
  end
end
