class OutcomesDashboard
  ALIGNED = 1
  UNALIGNED = 0
  private_constant :ALIGNED, :UNALIGNED

  def initialize(courses)
    @courses = courses
  end

  def courses_without_outcomes
    courses.without_outcomes
  end

  def unaligned_courses
    course_alignment[UNALIGNED]
  end

  def aligned_courses
    course_alignment[ALIGNED]
  end

  private

  attr_reader :courses

  def course_alignment
    @course_alignment ||= courses.with_outcomes.partition do |course|
      StandardOutcome.unaligned_with(course).any?
    end
  end
end
