class OutcomeAssessment < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :outcome, counter_cache: :assessments_count
end
