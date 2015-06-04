require "rails_helper"

feature "User adopts standard outcomes for a course" do
  scenario "successfully" do
    course = create(:course)
    standard_outcome = create(:standard_outcome)
    user = user_with_admin_access_to(course.department)

    visit course_path(course, as: user)
    click_on "Adopt Default Outcomes"

    expect(page).to have_content(standard_outcome.name)
    expect(page).to have_content(standard_outcome.description)
  end
end
