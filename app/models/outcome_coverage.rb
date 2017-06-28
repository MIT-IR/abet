class OutcomeCoverage < ApplicationRecord
  belongs_to :coverage
  belongs_to :outcome, required: true

  has_one :assignment

  delegate :label, :nickname, to: :outcome, prefix: true

  validates :outcome_id,
    uniqueness: { scope: [:coverage_id, :archived], unless: :archived }

  has_paper_trail

  def subject_name
    coverage.subject.to_s
  end
end
