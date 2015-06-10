class OutcomesDashboard
  def initialize(courses)
    @courses = courses
  end

  def courses_without_outcomes
    courses.where(outcomes_count: 0)
  end

  def unaligned_courses
    @unaligned_courses ||= courses.with_custom_outcomes.select do |course|
      StandardOutcome.unaligned_with(course).any?
    end
  end

  private

  attr_reader :courses
end
