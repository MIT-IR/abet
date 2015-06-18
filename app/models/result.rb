class Result < ActiveRecord::Base
  SEMESTERS = ["FA", "JA", "SP"]
  YEARS = (2014..2019).to_a

  belongs_to :assessment, polymorphic: true
  delegate :department, to: :assessment

  validates :assessment_name, presence: true
  validates :assessment_description, presence: true
  validates :percentage, presence: true, inclusion: { in: 0..100 }
  validates :semester,
    inclusion: { in: SEMESTERS, if: -> { semester.present? } }
  validates :year, presence: true, inclusion: { in: YEARS }
  validates :assessment_id,
    uniqueness: { scope: [:assessment_type, :semester, :year] }

  has_paper_trail
end
