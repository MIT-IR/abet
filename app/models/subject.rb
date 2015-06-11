class Subject < ActiveRecord::Base
  has_many :direct_assessments

  def self.sorted_by_number
    order(number: :asc).sort_by { |s| s.number.to_f }
  end

  def to_s
    "#{number} - #{title}"
  end

  def department
    Department.find_by(number: department_number)
  end
end
