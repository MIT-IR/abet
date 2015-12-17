class Outcome < ActiveRecord::Base
  belongs_to :course, counter_cache: true

  has_one :department, through: :course
  has_many :outcome_assessments, dependent: :destroy
  has_many :alignments
  has_many :standard_outcomes, through: :alignments
  has_many :direct_assessments,
    through: :outcome_assessments,
    source: :assessment,
    source_type: "DirectAssessment"
  has_many :indirect_assessments,
    through: :outcome_assessments,
    source: :assessment,
    source_type: "IndirectAssessment"
  has_many :active_direct_assessments,
    -> { where(archived: false) },
    through: :outcome_assessments,
    source: :assessment,
    source_type: "DirectAssessment"
  has_many :active_indirect_assessments,
    -> { where(archived: false) },
    through: :outcome_assessments,
    source: :assessment,
    source_type: "IndirectAssessment"

  accepts_nested_attributes_for :alignments,
    reject_if: ->(attributes) { attributes[:level].blank? },
    allow_destroy: true

  validates :name, presence: true, uniqueness: { scope: :course_id }
  validates :description, presence: true

  has_paper_trail

  def to_s
    "#{name} - #{description}"
  end
end
