class OutcomeAssessment < ActiveRecord::Base
  belongs_to :assessment, class_name: 'DirectAssessment'
  belongs_to :outcome, counter_cache: :assessments_count
end
