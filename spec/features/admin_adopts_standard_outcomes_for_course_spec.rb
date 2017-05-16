require "rails_helper"

feature "Admin adopts standard outcomes for a course" do
  scenario "en masse" do
    course = create(:course)
    standard_outcomes = create_pair(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_root_path(course, as: user)
    click_on t("manage_outcomes.dashboard.without_outcomes_actions.adopt_standard")

    expect(page).to have_outcome_nickname(standard_outcomes.first.nickname)
    expect(page).to have_outcome_name_and_description(standard_outcomes.first)
    expect(page).to have_outcome_nickname(standard_outcomes.last.nickname)
    expect(page).to have_outcome_name_and_description(standard_outcomes.last)

    click_on "Adopt"

    expect(page).to have_content t("manage_outcomes.standard_outcomes.create.success.other")
    expect(find(".fully-aligned")).to have_content(course.name)
  end

  scenario "a la carte" do
    course = create(:course)
    standard_outcome = create(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit manage_outcomes_course_outcomes_path(course, as: user)

    expect(find(".unaligned-outcomes")).to have_content standard_outcome

    click_on t("manage_outcomes.outcomes.unaligned_standard_outcomes.adopt")

    expect(page).to have_content t("manage_outcomes.standard_outcomes.create.success.one")
    expect(page).to have_outcome_nickname standard_outcome.nickname
    expect(page).to have_outcome_name_and_description standard_outcome
    expect(page).not_to have_css(".unassociated_outcomes")
  end

  def have_outcome_nickname(nickname)
    have_content(nickname)
  end

  def have_outcome_name_and_description(outcome)
    have_content(outcome)
  end
end
