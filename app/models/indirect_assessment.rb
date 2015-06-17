class IndirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment
  has_many :outcomes, through: :outcome_assessments

  has_many :results, as: :assessment

  belongs_to :department

  def to_s
    "#{name} - #{description}"
  end
end
