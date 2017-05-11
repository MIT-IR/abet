require "rails_helper"

feature "Admin views outcomes dashboard" do
  scenario "sees list of courses without outcomes" do
    course = create(:course)
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(as: user)

    expect(page).to have_content t("manage_outcomes.dashboard.show.titles.without_outcomes")
    expect(page).to have_content course.name
    expect(page).to have_link t("manage_outcomes.dashboard.without_outcomes_actions.adopt_standard")
  end

  scenario "sees list of courses with unaligned outcomes" do
    course = create(:course, :with_unaligned_outcome)
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(as: user)

    expect(page).to have_content course.name
    expect(page).to have_link t("manage_outcomes.dashboard.unaligned_outcomes_actions.view_outcomes")
    expect(page).to have_content t("manage_outcomes.dashboard.show.titles.unaligned_outcomes")
  end
end
