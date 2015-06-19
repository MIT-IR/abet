require "rails_helper"

feature "Admin edits outcome" do
  scenario "adds additional alignment" do
    outcome = create(:alignment).outcome
    standard_outcome = create(:standard_outcome)
    user = user_with_admin_access_to(outcome.department)

    visit edit_manage_outcomes_outcome_path(outcome, as: user)
    select Alignment::MODERATE, from: standard_outcome
    click_button "Update Outcome"

    expect(page).to have_content "Outcome updated successfully"
    expect(page).not_to have_css ".unaligned-outcomes"
  end

  scenario "removes an alignment" do
    alignment = create(:alignment)
    user = user_with_admin_access_to(alignment.outcome.department)

    visit edit_manage_outcomes_outcome_path(alignment.outcome, as: user)
    check "Remove"
    click_button "Update Outcome"

    expect(page).to have_css ".unaligned-outcomes"
  end
end
