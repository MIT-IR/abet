class OutcomeCoverage < ActiveRecord::Base
  belongs_to :course
  belongs_to :outcome
  belongs_to :subject
end
