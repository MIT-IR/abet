class Outcome < ActiveRecord::Base
  belongs_to :course, counter_cache: true

  has_many :outcome_assessments
  has_many :direct_assessments, through: :outcome_assessments, source: :assessment, source_type: "DirectAssessment"
  has_many :indirect_assessments, through: :outcome_assessments, source: :assessment, source_type: "IndirectAssessment"

  has_many :alignments
  accepts_nested_attributes_for :alignments,
    reject_if: ->(attributes) { attributes[:level].blank? }

  delegate :department, to: :course

  def to_s
    "#{name} - #{description}"
  end
end
