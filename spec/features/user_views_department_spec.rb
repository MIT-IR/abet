require "rails_helper"

feature "User views department" do
  scenario "sees courses for that department" do
    user = create(:user)
    course = create(:course)
    other_course = create(:course)

    visit department_path(course.department, as: user)

    expect(page).to have_content(course.course_name)
    expect(page).not_to have_content(other_course.course_name)
  end
end
