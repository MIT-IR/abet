class IndirectAssessment < ActiveRecord::Base
  belongs_to :outcome
  has_many :results, as: :assessment

  delegate :department, to: :outcome
end
