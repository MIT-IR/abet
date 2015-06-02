require "rails_helper"

feature "User visits homepage" do
  scenario "sees department list if they have access to multiple departments" do
    user = create(:user)
    departments = create_pair(:department)
    grant_access(user, departments, "CAN EDIT ABET")

    visit root_path(as: user)

    expect(page).to have_content(departments.first.name)
    expect(page).to have_content(departments.last.name)
  end
end
