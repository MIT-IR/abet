namespace :assessments do
  desc "Migrate assessments to assignments"
  task migrate: :environment do
    ActiveRecord::Base.transaction do
      Assessment.includes(:outcomes, :courses).find_each do |assessment|
        MigrateAssessment.call(assessment)
      end
    end
  end

  class MigrateAssessment
    def self.call(assessment)
      new(assessment).call
    end

    def initialize(assessment)
      @assessment = assessment
      @coverage = Coverage.find_or_initialize_by(
        course_id: assessment.course_ids.first,
        subject_id: assessment.subject_id,
      )
    end

    def call
      coverage.save!(validate: false)
      add_outcomes_to_coverage
    end

    private

    attr_reader :assessment, :coverage

    def add_outcomes_to_coverage
      AddOutcomes.call(from: assessment, to: coverage)
    end
  end

  class AddOutcomes
    def self.call(from:, to:)
      new(from: from, to: to).call
    end

    def initialize(from:, to:)
      @assessment = from
      @coverage = to
    end

    def call
      assessment.outcomes.each do |outcome|
        outcome_coverage = add_outcome_coverage(outcome)
        assignment = outcome_coverage.create_assignment(
          name: assessment.name,
          problem: assessment.problem_description,
        )

        assessment.results.update_all(assignment_id: assignment.id)
      end
    end

    private

    attr_reader :assessment, :coverage

    def add_outcome_coverage(outcome)
      coverage.outcome_coverages.create!(
        outcome_id: outcome.id,
        archived: assessment.archived? || should_be_archived?(outcome)
      )
    end

    def should_be_archived?(outcome)
      most_recently_active = Assessment.
        joins(:outcomes).
        where(archived: false).
        where(subject_id: assessment.subject_id).
        where(outcomes: { id: outcome.id }).
        order(results_count: :desc).
        order(created_at: :desc).
        first

      most_recently_active != assessment
    end
  end
end
