require "rails_helper"

feature "User adds assignment to outcome coverage" do
  scenario "successfully" do
    outcome = create(:outcome)
    course = outcome.course
    coverage = create(:coverage, course: course, outcomes: [outcome])
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course.id, as: user)

    expect(page).to have_content(course.name)
    expect(page).to have_content(course.number)

    click_on t("manage_assessments.outcome_coverages.outcome_coverage.add_assignment")
    fill_in :assignment_name, with: "Problem Set 2"
    fill_in :assignment_problem, with: "Question 4"
    click_on "Attach student work"
    attach("spec/fixtures/attachments/example.pdf")
    click_on t("manage_assessments.assignments.new.add")
    click_on t("helpers.submit.coverage.create")

    expect(page).to have_content(course.name)
    expect(page).to have_content(course.number)

    within("#matched_outcomes") do
      expect(page).to have_content("Problem Set 2")
      expect(page).to have_content("Question 4")
    end
  end

  def attach(path)
    all("input.file").last.set(File.absolute_path(path))
  end
end
