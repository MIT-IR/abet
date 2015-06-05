class DirectAssessment < ActiveRecord::Base
  belongs_to :outcome

  delegate :department, to: :outcome
end
