class Assignment < ActiveRecord::Base
  belongs_to :outcome_coverage

  has_one :outcome, through: :outcome_coverage
  has_one :coverage, through: :outcome_coverage
  has_one :subject, through: :coverage
  has_one :course, through: :coverage

  has_many :attachments, as: :attachable
  has_many :results

  accepts_nested_attributes_for :attachments,
    allow_destroy: true,
    reject_if: :all_blank

  delegate :course_number, :course_name, to: :outcome
  delegate :department, to: :subject, prefix: true
  delegate :department, to: :course, prefix: true

  validates :name, presence: true
end
