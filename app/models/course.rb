class Course < ActiveRecord::Base
  belongs_to :department
  has_many :outcomes, -> { order(:name) }
  has_many :outcomes_with_metadata,
    -> { order(:name) },
    foreign_key: :course_id,
    class_name: "OutcomeWithMetadata"

  def self.without_outcomes
    where(outcomes_count: 0)
  end

  def self.with_outcomes
    where.not(outcomes_count: 0)
  end

  def adopt_custom_outcomes!
    update_column(:has_custom_outcomes, true)
  end

  def to_s
    "#{number}: #{name}"
  end
end
