require "rails_helper"

feature "User visits outcome" do
  scenario "and sees existing assessments" do
    outcome = create(:outcome)
    direct_assessment = create(:direct_assessment)
    direct_assessment.outcomes << outcome
    indirect_assessment = create(:survey)
    indirect_assessment.outcomes << outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit course_path(outcome.course, as: user)

    within("#outcome_#{outcome.id}") do
      click_on "Details"
    end

    within("#direct_assessments") do
      expect(page).to have_css("tr#direct_assessment-#{direct_assessment.id}")
    end

    within("#indirect_assessments") do
      expect(page).
        to have_css("tr#indirect_assessment-#{indirect_assessment.id}")
    end
  end
end
