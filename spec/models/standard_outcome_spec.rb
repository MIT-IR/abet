require "rails_helper"

describe StandardOutcome do
  describe ".aligned_with" do
    it "returns standard outcomes aligned with a course" do
      course = create(:course)
      outcome = create(:outcome, course: course)
      standard_outcome = create(:alignment, outcome: outcome).standard_outcome

      expect(StandardOutcome.aligned_with(course)).to eq [standard_outcome]
    end
  end

  describe ".unaligned_with" do
    it "returns standard outcomes not aligned with a course" do
      course = create(:course)
      outcome = create(:outcome, course: course)
      standard_outcome = create(:standard_outcome)
      create(:alignment, outcome: outcome)

      expect(StandardOutcome.unaligned_with(course)).to eq [standard_outcome]
    end
  end
end
