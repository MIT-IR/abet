require "rails_helper"

feature "User archives assessments" do
  scenario "when preparing to enter results for direct assessments" do
    assessment = create(:direct_assessment)
    user = user_with_assessments_access_to(assessment.outcomes.first.department)

    visit manage_results_subject_path(assessment.subject, as: user)
    click_link "Archive"

    expect(page).to have_content "has been archived"
    expect(page).not_to have_content assessment.name
  end
end
