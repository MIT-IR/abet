class Subject < ActiveRecord::Base
  has_many :direct_assessments, -> { merge(DirectAssessment.unarchived) }

  def self.sorted_by_number
    order(number: :asc).sort_by { |s| s.number.to_f }
  end

  def self.with_direct_assessments
    joins(:direct_assessments).uniq
  end

  def to_s
    "#{number} - #{title}"
  end

  def department
    Department.find_by(number: department_number)
  end
end
