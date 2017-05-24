class Assignment < ActiveRecord::Base
  belongs_to :outcome_coverage

  has_one :outcome, through: :outcome_coverage

  delegate :department, to: :outcome
  delegate :course_number, :course_name, to: :outcome

  validates :name, presence: true
end
