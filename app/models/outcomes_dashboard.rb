class OutcomesDashboard
  ALIGNED = 1
  UNALIGNED = 0
  private_constant :ALIGNED, :UNALIGNED

  def initialize(courses)
    @courses = courses
  end

  def courses_without_outcomes
    courses.select { |course| course.outcomes_count == 0 }
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
    @course_alignment ||= courses_with_outcomes.partition do |course|
      StandardOutcome.unaligned_with(course).any?
    end
  end

  def courses_with_outcomes
    courses - courses_without_outcomes
  end
end
