class CourseCoverage < SimpleDelegator
  def ordered_coverages
    @ordered_coverages ||= coverages.sort_by do |coverage|
      coverage.subject.number
    end
  end

  def has_coverages?
    coverages.where(archived: false).present?
  end

  def covered_outcomes_count
    @covered_outcomes_count = outcome_coverages.map(&:outcome_id).uniq.size
  end

  def uncovered_outcomes_count
    @uncovered_outcomes_count ||= outcomes_count - covered_outcomes_count
  end
end
