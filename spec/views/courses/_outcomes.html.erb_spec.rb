require "rails_helper"

describe "courses/outcomes" do
  it "shows the add assessment link if authorized" do
    outcome = create(:outcome)
    stub_policy(create_assessments?: true)

    render "courses/outcomes", course: outcome.course

    expect(page).to have_link("Assess")
  end

  it "does not show the add assessment link if unauthorized" do
    outcome = create(:outcome)
    stub_policy(create_assessments?: false)

    render "courses/outcomes", course: outcome.course

    expect(page).not_to have_link("Assess")
  end

  it "shows the create_custom outcomes link if authorized" do
    course = build_stubbed(:course, has_custom_outcomes: true)
    stub_policy(create_outcomes?: true)

    render "courses/outcomes", course: course, unassociated_outcomes: []

    expect(page).to have_link("New custom outcome")
  end

  it "does not show the create_custom outcomes link if unauthorized" do
    course = build_stubbed(:course, has_custom_outcomes: true)
    stub_policy(create_outcomes?: false)

    render "courses/outcomes", course: course, unassociated_outcomes: []

    expect(page).not_to have_link("New custom outcome")
  end
end
