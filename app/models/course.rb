class Course < ActiveRecord::Base
  belongs_to :department
  has_many :outcomes, -> { order(:label) }
  has_many :outcomes_with_metadata,
    -> { order(:label) },
    foreign_key: :course_id,
    class_name: "OutcomeWithMetadata"
  has_many :outcome_coverages

  def self.without_outcomes
    where(outcomes_count: 0)
  end

  def self.with_outcomes
    where.not(outcomes_count: 0)
  end

  def adopt_custom_outcomes!
    update_column(:has_custom_outcomes, true)
  end

  def active_assessments_count
    outcomes_with_metadata.to_a.sum(&:active_assessments_count)
  end

  def active_assessments_with_results_count
    outcomes_with_metadata.to_a.sum(&:active_assessments_with_results_count)
  end

  def to_s
    "#{number}: #{name}"
  end
end
