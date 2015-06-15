require "rails_helper"

describe "courses/_interstitial.html.erb" do
  it "shoes outcome creation links if authorized" do
    course = build_stubbed(:course, department: build_stubbed(:department))
    stub_policy(create_outcomes?: true)

    render "courses/interstitial", course: course

    expect(page).to have_link "Adopt Standard Outcomes"
  end

  it "does not show outcome creation links if unauthorized" do
    course = build_stubbed(:course, department: build_stubbed(:department))
    stub_policy(create_outcomes?: false)

    render "courses/interstitial", course: course

    expect(page).not_to have_link "Adopt Standard Outcomes"
  end
end
