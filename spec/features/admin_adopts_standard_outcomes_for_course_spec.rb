require "rails_helper"

feature "Admin adopts standard outcomes for a course" do
  scenario "en masse" do
    course = create(:course)
    standard_outcome = create(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit outcomes_dashboard_path(course, as: user)
    click_on "Adopt Default Outcomes"

    expect(page).to have_content(standard_outcome.name)
    expect(page).to have_content(standard_outcome.description)

    click_on "Adopt"

    expect(page).to have_content "Default outcomes successfully adopted."
    expect(find(".fully-aligned")).to have_content(course.name)
  end
end
