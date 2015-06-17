require "rails_helper"

feature "User updates a direct assessment" do
  scenario "a direct assessment is successfully updated" do
    assessment = create(:direct_assessment, target_percentage: 50)
    outcome = assessment.outcomes.first
    other_outcome = create(:outcome, course: outcome.course)
    user = user_with_admin_access_to(outcome.department)

    visit outcome_path(outcome, as: user)

    within("#direct_assessment-#{assessment.id}") do
      click_on "Edit"
    end

    check(other_outcome.to_s)
    fill_in "direct_assessment_target_percentage", with: 85
    click_on "Submit"

    expect(page).to have_content assessment.subject
    expect(page).to have_content outcome
    expect(page).to have_content other_outcome
    expect(page).to have_content("85")
  end
end
