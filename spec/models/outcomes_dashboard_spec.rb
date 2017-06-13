require "rails_helper"

describe OutcomesDashboard do
  describe "#courses_without_outcomes" do
    it "returns courses without any outcomes" do
      course_without_outcomes = double("Course", outcomes_count: 0)
      course_with_outcomes = double("Course", outcomes_count: 5)

      dashboard = OutcomesDashboard.new([course_with_outcomes, course_without_outcomes])

      expect(dashboard.courses_without_outcomes).to eq [course_without_outcomes]
    end
  end

  describe "#unaligned_courses" do
    it "returns courses with outcomes and that are not fully aligned" do
      unaligned_course = create(:course, :with_unaligned_outcome)
      create(:course, :fully_aligned)
      create(:course)

      dashboard = OutcomesDashboard.new(Course.all)

      expect(dashboard.unaligned_courses).to eq [unaligned_course]
    end
  end

  describe "#aligned_courses" do
    it "returns courses with outcomes fully aligned to standard outcomes" do
      create(:course)
      create(:course, :with_unaligned_outcome)
      aligned_course = create(:course, :fully_aligned)

      dashboard = OutcomesDashboard.new(Course.all)

      expect(dashboard.aligned_courses).to eq [aligned_course]
    end
  end
end
