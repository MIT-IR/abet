require "rails_helper"

feature "User visits homepage" do
  scenario "sees department list if they have access to multiple departments" do
    departments = create_pair(:department)
    user = user_with_read_access_to(departments)

    visit root_path(as: user)

    expect(page).to have_content(departments.first.name)
    expect(page).to have_content(departments.last.name)
  end
end
