require "rails_helper"

feature "Admin creates custom outcomes" do
  scenario "successfully" do
    standard_outcome = create(:standard_outcome)
    course = create(:course)
    user = user_with_admin_access_to(course.department)
    description = "Can read good"

    visit outcomes_dashboard_path(as: user)
    click_link "Create Custom Outcome"
    fill_in "Name", with: "X"
    fill_in "Description", with: description
    select Alignment::LEVELS.first, from: standard_outcome
    click_on "Create Outcome"

    expect(page).to have_text description
  end
end
