class Course < ApplicationRecord
  belongs_to :department

  has_many :coverages, -> { where archived: false }
  has_many :outcome_coverages, through: :coverages
  has_many :outcomes

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
