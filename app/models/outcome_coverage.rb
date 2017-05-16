class OutcomeCoverage < ActiveRecord::Base
  belongs_to :course
  belongs_to :outcome
  belongs_to :subject

  delegate :name, :nickname, to: :outcome, prefix: true
  delegate :title, to: :subject, prefix: true
end
