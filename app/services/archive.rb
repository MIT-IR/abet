class Archive
  def self.process(outcome_coverage:)
    new(outcome_coverage: outcome_coverage).process
  end

  def initialize(outcome_coverage:)
    @outcome_coverage = outcome_coverage
  end

  def process
    if coverage_has_more_than_one(outcome_coverage)
      outcome_coverage.update!(archived: true)
    else
      archive_coverage_and(outcome_coverage)
    end
  end

  private

  attr_reader :outcome_coverage

  def coverage_has_more_than_one(outcome_coverage)
    outcome_coverage.coverage.outcomes.count > 1
  end

  def archive_coverage_and(outcome_coverage)
    ApplicationRecord.transaction do
      outcome_coverage.coverage.update!(archived: true)
      outcome_coverage.update!(archived: true)
    end
  end
end
