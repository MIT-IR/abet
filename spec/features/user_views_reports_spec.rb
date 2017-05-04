require "rails_helper"

feature "User views reports" do
  scenario "sees list of accessible courses if they have access to multiple" do
    user = create(:user)
    courses = create_pair(:course)
    grant_access(user, courses.map(&:department), Permission::ASSESSMENTS)

    visit reports_path(as: user)

    expect(page).to have_content(courses.first.name)
    expect(page).to have_content(courses.last.name)
  end
end
