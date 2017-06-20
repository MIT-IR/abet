module CoverageHelper
  def available_outcomes(coverage)
    coverage.course.outcomes.alphabetical - coverage.outcomes
  end
end
