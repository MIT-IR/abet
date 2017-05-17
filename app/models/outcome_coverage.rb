class OutcomeCoverage < ActiveRecord::Base
  belongs_to :course
  belongs_to :outcome, required: true
  belongs_to :subject, required: true

  validates :outcome_id, presence: true
  validates :subject_id, presence: true

  delegate :label, :nickname, to: :outcome, prefix: true
end
