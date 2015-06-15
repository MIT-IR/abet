require "rails_helper"

describe OutcomesDashboard do
  describe "#courses_without_outcomes" do
    it "returns courses without any outcomes" do
      course = double("Course")
      allow(Course).to receive(:without_outcomes).and_return([course])

      dashboard = OutcomesDashboard.new(Course)

      expect(dashboard.courses_without_outcomes).to eq [course]
    end
  end

  describe "#unaligned_courses" do
    it "returns courses with outcomes and that are not fully aligned" do
      unaligned_course = create(:course, :with_unaligned_outcome)
      create(:course, :fully_aligned)
      create(:course)

      dashboard = OutcomesDashboard.new(Course)

      expect(dashboard.unaligned_courses).to eq [unaligned_course]
    end
  end

  describe "#aligned_courses" do
    it "returns courses with outcomes fully aligned to standard outcomes" do
      create(:course)
      create(:course, :with_unaligned_outcome)
      aligned_course = create(:course, :fully_aligned)

      dashboard = OutcomesDashboard.new(Course)

      expect(dashboard.aligned_courses).to eq [aligned_course]
    end
  end
end
