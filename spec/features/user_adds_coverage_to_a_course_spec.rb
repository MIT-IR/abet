require "rails_helper"

feature "user adds coverage to a course" do
  scenario "successfully", js: true do
    subject = create(:subject)
    course = create(:course)
    first_outcome, second_outcome = create_pair(:outcome, course: course)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course, as: user)
    click_on t('manage_assessments.courses.show.add_a_class')
    selectize subject.title, from: "Subject"
    selectize first_outcome.nickname, from: "Outcome"
    click_on t('manage_assessments.coverages.new.add_outcome')
    selectize second_outcome.nickname, from: "Outcome"
    attach("spec/fixtures/syllabus.pdf")
    click_on t('manage_assessments.coverages.new.add_attachment')
    attach("spec/fixtures/syllabus.pdf")
    click_button t('helpers.submit.coverage.create')

    within("#matched_outcomes") do
      expect(page).to have_content(subject.title)
      expect(page).to have_content(first_outcome.nickname)
      expect(page).to have_content(second_outcome.nickname)
    end
  end

  scenario "via unmatched outcome link" do
    course = create(:course)
    matched_outcome, unmatched_outcome = create_pair(:outcome, course: course)
    coverage = create(:coverage, course: course, outcomes: [matched_outcome])
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course.id, as: user)
    click_on unmatched_outcome.nickname

    expect(page).to have_css("h1.headline-narrow", text: "Add a class")
    expect(page).to have_prepopulated_select_box(unmatched_outcome.nickname)
  end

  def selectize(item, from:)
    container = find_field(from, visible: false).first(:xpath, ".//..")
    container.find(".selectize-control").click
    container.find("div.option", text: item).click
  end

  def attach(path)
    all("input.file").last.set(File.absolute_path(path))
  end

  def have_prepopulated_select_box(text)
    have_css("select", text: text)
  end

end
