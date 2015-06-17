class IndirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment
  has_many :outcomes, through: :outcome_assessments

  has_many :results, as: :assessment

  def department
    outcomes.first.department
  end

  has_paper_trail

  def to_s
    "#{name} - #{description}"
  end
end
