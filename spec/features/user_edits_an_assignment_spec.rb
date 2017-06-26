require "rails_helper"

feature "User edits an assignment on an outcome coverage" do
  scenario "successfully" do
    assignment = create(:assignment)
    user = user_with_assignments_access_to(assignment.course.department)

    visit manage_assignments_course_path(assignment.course.id, as: user)
    
    click_on assignment.name
    fill_in :assignment_name, with: "Problem Set 2 Edited"
    fill_in :assignment_problem, with: "Question 4 Edited"
    click_on t("helpers.submit.coverage.update")

    expect(page).to have_content("Problem Set 2 Edited")
    expect(page).to have_content("Question 4 Edited")
  end
end
