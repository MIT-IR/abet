class Result < ActiveRecord::Base
  SEMESTERS = ["FA", "JA", "SP"]
  YEARS = (2012..2019).to_a

  before_save :denormalize_department

  belongs_to :assessment, counter_cache: true
  belongs_to :department

  validates :assessment_name, presence: true
  validates :assessment_description, presence: true
  validates :percentage, presence: true, inclusion: { in: 0..100 }
  validates :semester,
    inclusion: { in: SEMESTERS, if: -> { semester.present? } }
  validates :year, presence: true, inclusion: { in: YEARS }
  validates :assessment_id,
    uniqueness: { scope: [:semester, :year] }

  has_paper_trail

  def name
    "#{assessment_name} - #{assessment_description}"
  end

  private

  def denormalize_department
    self.department = assessment.department
  end
end
