require "rails_helper"

describe "outcomes/show.html.erb" do
  it "shows table headers when assessments are present" do
    assign(:outcome, build_stubbed(:outcome))
    assign(:direct_assessments, [build_stubbed(:direct_assessment)])
    assign(:indirect_assessments, [build_stubbed(:survey)])

    render

    expect(page).to have_selector("th", text: "Subject Number")
    expect(page).to have_selector("th", text: "Minimum Category")
  end

  it "does not show table headers when there are no assessments" do
    assign(:outcome, build_stubbed(:outcome))
    assign(:direct_assessments, [])
    assign(:indirect_assessments, [])

    render

    expect(page).to have_content("No direct assessments")
    expect(page).not_to have_selector("th", text: "Subject Number")

    expect(page).to have_content("No indirect assessments")
    expect(page).not_to have_selector("th", text: "Minimum Category")
  end
end
