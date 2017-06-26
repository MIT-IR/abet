class Assignment < ActiveRecord::Base
  belongs_to :outcome_coverage

  has_one :outcome, through: :outcome_coverage
  has_one :coverage, through: :outcome_coverage

  has_many :attachments, as: :attachable
  has_many :results

  accepts_nested_attributes_for :attachments,
    allow_destroy: true,
    reject_if: :all_blank

  delegate :course, to: :outcome
  delegate :subject, to: :coverage
  delegate :number, :name, to: :course, prefix: true
  delegate :department, to: :subject, prefix: true
  delegate :department, to: :course, prefix: true

  validates :name, presence: true

  has_paper_trail

  def subject_name
    subject.to_s
  end
end
