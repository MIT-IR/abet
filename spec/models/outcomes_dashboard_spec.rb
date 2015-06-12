require "rails_helper"

describe OutcomesDashboard do
  describe "#courses_without_outcomes" do
    it "returns courses without any outcomes" do
      course = create(:course)
      create(:outcome)

      dashboard = OutcomesDashboard.new(Course)

      expect(dashboard.courses_without_outcomes).to eq [course]
    end
  end

  describe "#unaligned_courses" do
    it "returns courses that are not fully aligned" do
      unaligned_course = create(:course, has_custom_outcomes: true)
      aligned_course = create(:course, has_custom_outcomes: true)
      create(:course, has_custom_outcomes: false)
      outcome = create(:outcome, course: aligned_course)
      create(:alignment, outcome: outcome)

      dashboard = OutcomesDashboard.new(Course)

      expect(dashboard.unaligned_courses).to eq [unaligned_course]
    end
  end
end
