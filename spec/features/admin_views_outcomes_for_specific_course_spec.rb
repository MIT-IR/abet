require "rails_helper"

feature "Admin views the outcomes for a specific course" do
  scenario "with fully aligned outcomes" do
    course = create(:course, :fully_aligned)
    admin = user_with_admin_access_to(course.department)

    view_outcomes_of_a_specific_course_as(admin)

    course_outcome_label = course.outcomes.first.label
    course_outcome_description = course.outcomes.first.description

    expect(page).to have_content t("manage_outcomes.outcomes.outcomes.add_outcome")
    expect(page).to have_outcome_label(course_outcome_label)
    expect(page).to have_outcome_description(course_outcome_description)
    expect(page).to have_content t("manage_outcomes.outcomes.outcomes.edit_outcome")
  end

  scenario 'with unaligned outcomes' do
    course = create(:course, :with_unaligned_outcome)
    admin = user_with_admin_access_to(course.department)

    view_outcomes_of_a_specific_course_as(admin)

    course_outcome_label = course.outcomes.first.label
    course_outcome_description = course.outcomes.first.description

    expect(page).to have_content t("manage_outcomes.outcomes.outcomes.add_outcome")
    expect(page).to have_outcome_label(course_outcome_label)
    expect(page).to have_outcome_description(course_outcome_description)
    expect(page).to have_content t("manage_outcomes.outcomes.outcomes.edit_outcome")
  end

  def have_outcome_label(label)
    have_content(label)
  end

  def have_outcome_description(text)
    have_content(text)
  end

  def view_outcomes_of_a_specific_course_as(user)
    visit manage_outcomes_root_path(as: user)
    click_on "View Outcomes"
  end
end
