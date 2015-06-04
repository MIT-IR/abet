require "rails_helper"

feature "User clones a survey assessment" do
  scenario "it creates a new assessment defaulting to the same attributes" do
    assessment = create(
      :survey,
      assessment_name: "Senior Survey",
      year: 2014
    )
    outcome = assessment.outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#indirect_assessment-#{assessment.id}") do
      click_on "Clone"
    end

    select "2015", from: "survey_year"
    click_on "Submit"

    rows = all(:xpath, "//table/tr[contains(@id,'indirect_assessment')]")

    expect(rows.first).to have_content("2014")
    expect(rows.first).to have_content("Senior Survey")

    expect(rows.last).to have_content("2015")
    expect(rows.last).to have_content("Senior Survey")
  end
end
