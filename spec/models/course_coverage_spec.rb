require "rails_helper"

describe CourseCoverage do
  describe "#ordered_coverages" do
    it "sorts by the associated subject number" do
      course = create(:course)
      subject_a = create(:subject, number: 2)
      subject_b = create(:subject, number: 1)
      coverage_a = create(:coverage, course: course, subject: subject_a)
      coverage_b = create(:coverage, course: course, subject: subject_b)
      course_coverage = CourseCoverage.new(course)

      expect(course_coverage.ordered_coverages).to eq [coverage_b, coverage_a]
    end
  end
end
