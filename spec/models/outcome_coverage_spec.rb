require "rails_helper"

describe OutcomeCoverage do
  it "validates that outcome coverage is unique per coverage" do
    course = create(:course)
    outcome = create(:outcome)
    coverage = create(:coverage, course: course, outcomes: [outcome])
    outcome_coverage = OutcomeCoverage.new(coverage: coverage, outcome: outcome)

    expect(outcome_coverage).to validate_uniqueness_of(:outcome_id).scoped_to(:coverage_id)
  end
end
