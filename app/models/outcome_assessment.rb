class OutcomeAssessment < ActiveRecord::Base
  belongs_to :assessment, polymorphic: true
  belongs_to :outcome
end
