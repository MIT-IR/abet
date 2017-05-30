require "rails_helper"

feature "User edits course coverage" do
  scenario "by adding another outcome successfully" do
    course = create(:course)
    outcome = create(:outcome)
    coverage = create(:coverage, course: course, outcomes: [outcome])
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course.id, as: user)
    click_on t("manage_assessments.coverages.coverage.add_another_outcome")

    expect(page).to have_css("h1.headline-narrow", text: "Add and Edit Outcomes")
    expect(page).to have_prepopulated_select_box(coverage.subject.title)
  end

  def have_prepopulated_select_box(text)
    have_css("select", text: text)
  end
end
