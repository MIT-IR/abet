class DirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment
  has_many :outcomes, through: :outcome_assessments

  belongs_to :department
  belongs_to :subject
  has_many :results, as: :assessment

  validates :subject, presence: true

  def to_s
    "#{name} - #{description}"
  end
end
