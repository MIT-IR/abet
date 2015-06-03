require "rails_helper"

feature "User adopts standard outcomes for a course" do
  scenario "successfully" do
    user = create(:user)
    course = create(:course)
    standard_outcome = create(:standard_outcome)
    grant_access(user, course.department, Permission::ADMIN)

    visit course_path(course, as: user)
    click_on "Adopt Default Outcomes"

    expect(page).to have_content(standard_outcome.name)
    expect(page).to have_content(standard_outcome.description)
  end
end
