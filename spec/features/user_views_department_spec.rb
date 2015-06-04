require "rails_helper"

feature "User views department" do
  scenario "sees courses for that department" do
    course = create(:course)
    other_course = create(:course)
    user = user_with_read_access_to(course.department)

    visit department_path(course.department, as: user)

    expect(page).to have_content(course.name)
    expect(page).not_to have_content(other_course.name)
  end
end
