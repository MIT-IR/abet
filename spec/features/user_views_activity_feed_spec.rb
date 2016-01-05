require "rails_helper"

feature "User views activity feed" do
  around do |example|
    PaperTrail.enabled = true
    example.run
    PaperTrail.enabled = false
  end

  scenario "sees recent results they have access to" do
    result = create(:result)
    result.update!(percentage: 99)
    user = user_with_read_access_to(result.department)

    visit activities_path(as: user)

    expect(page).to have_content "Results created for #{result.name}"
    expect(page).to have_content "Results updated for #{result.name}"
  end
end
