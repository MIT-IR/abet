require "rails_helper"

feature "Admin adopts standard outcomes for a course" do
  scenario "en masse" do
    course = create(:course)
    standard_outcomes = create_pair(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit outcomes_dashboard_path(course, as: user)
    click_on "Adopt Standard Outcomes"

    expect(page).to have_content(standard_outcomes.first)
    expect(page).to have_content(standard_outcomes.last)

    click_on "Adopt"

    expect(page).to have_content "Standard outcomes successfully adopted."
    expect(find(".fully-aligned")).to have_content(course.name)
  end

  scenario "a la carte" do
    course = create(:course)
    standard_outcome = create(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit course_outcomes_path(course, as: user)

    expect(find(".unaligned-outcomes")).to have_content standard_outcome

    click_on "Adopt"

    expect(page).to have_content "Standard outcome successfully adopted."
    expect(page).to have_content standard_outcome
    expect(page).not_to have_css(".unassociated_outcomes")
  end
end
