require "rails_helper"

feature "User views assignment report" do
  scenario "sees assignment results for the course" do
    result = create(:result)
    course = result.assignment.course
    user = user_with_assignments_access_to(course.department)

    visit reports_path(as: user)
    click_link t("reports.assignment_reports.show.csv_link")
    header = page.response_headers["Content-Disposition"]

    expect(header).to match(/^attachment/)
    expect(header).to match(/filename="#{course.name.parameterize}-assignment-report.csv"$/)
  end
end
