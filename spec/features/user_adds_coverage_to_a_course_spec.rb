require "rails_helper"

feature "user adds coverage to a course" do
  scenario "successfully", js: true do
    subject = create(:subject)
    course = create(:course)
    outcome = create(:outcome, course: course)
    user = user_with_assessments_access_to(course.department)

    visit manage_assessments_course_path(course, as: user)
    click_on t('manage_assessments.courses.show.add_a_class')
    selectize subject.title, from: "Subject"
    selectize outcome.nickname, from: "Outcome"
    click_button t('helpers.submit.coverage.create')

    within("#matched_outcomes") do
      expect(page).to have_content(subject.title)
      expect(page).to have_content(outcome.nickname)
    end
  end

  def selectize(item, from:)
    container = find_field(from, visible: false).first(:xpath, ".//..")
    container.find(".selectize-control").click
    container.find("div.option", text: item).click
  end
end
