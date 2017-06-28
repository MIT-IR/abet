class Subject < ApplicationRecord
  belongs_to :department, foreign_key: :department_number, primary_key: :number

  has_many :coverages
  has_many :outcome_coverages, through: :coverages
  has_many :outcomes, through: :outcome_coverages
  has_many :assignments, through: :outcome_coverages

  def self.sorted_by_number
    order(number: :asc).sort_by { |s| s.number.to_f }
  end

  def self.with_assignments
    joins(:assignments).distinct
  end

  def to_s
    "#{number} - #{title}"
  end
end
