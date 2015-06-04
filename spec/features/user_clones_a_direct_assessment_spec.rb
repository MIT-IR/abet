require "rails_helper"

feature "User clones a direct assessment" do
  scenario "it creates a new assessment defaulting to the same attributes" do
    assessment = create(
      :direct_assessment,
      subject_description: "Theoretical Physics",
      semester: "2015FA"
    )
    outcome = assessment.outcome
    user = user_with_admin_access_to(outcome.course.department)

    visit outcome_path(outcome, as: user)

    within("#direct_assessment-#{assessment.id}") do
      click_on "Clone"
    end

    select "2015JA", from: "direct_assessment_semester"
    click_on "Submit"

    rows = all(:xpath, "//table/tr[contains(@id,'direct_assessment')]")

    expect(rows.first).to have_content("2015FA")
    expect(rows.first).to have_content("Theoretical Physics")

    expect(rows.last).to have_content("2015JA")
    expect(rows.last).to have_content("Theoretical Physics")
  end
end
