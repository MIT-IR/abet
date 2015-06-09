class DirectAssessment < ActiveRecord::Base
  belongs_to :outcome
  belongs_to :subject
  has_many :results, as: :assessment

  delegate :department, to: :outcome
end
