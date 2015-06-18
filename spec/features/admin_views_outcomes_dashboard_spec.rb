require "rails_helper"

feature "Admin views outcomes dashboard" do
  scenario "sees list of courses without outcomes" do
    course = create(:course)
    user = user_with_admin_access_to(course.department)

    visit outcomes_dashboard_path(as: user)

    expect(page).to have_content "Courses without Outcomes"
    expect(page).to have_content course.name
    expect(page).to have_link "Adopt Standard Outcomes"
  end

  scenario "sees list of courses with unaligned outcomes" do
    course = create(:course, :with_unaligned_outcome)
    user = user_with_admin_access_to(course.department)

    visit outcomes_dashboard_path(as: user)

    expect(page).to have_content course.name
    expect(page).to have_link "Edit Outcomes"
    expect(page).to have_content "Courses with Unaligned Outcomes"
  end
end
