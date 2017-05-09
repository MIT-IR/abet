class Subject < ActiveRecord::Base
  belongs_to :department, foreign_key: :department_number, primary_key: :number

  has_many :assessments, -> { merge(Assessment.unarchived).order(:name) }
  has_many :outcomes, through: :assessments

  def self.sorted_by_number
    order(number: :asc).sort_by { |s| s.number.to_f }
  end

  def self.with_assessments
    joins(:assessments).distinct
  end

  def to_s
    "#{number} - #{title}"
  end
end
