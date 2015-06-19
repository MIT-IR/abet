class OutcomeAssessment < ActiveRecord::Base
  belongs_to :assessment, polymorphic: true
  belongs_to :outcome, counter_cache: :assessments_count
end
