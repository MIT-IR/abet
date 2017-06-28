class Result < ApplicationRecord
  SEMESTERS = ["FA", "JA", "SP"]
  YEARS = (2012..2019).to_a

  before_save :denormalize_department

  belongs_to :assignment
  belongs_to :department

  validates :percentage, presence: true, inclusion: { in: 0..100 }
  validates :semester,
    inclusion: { in: SEMESTERS, if: -> { semester.present? } }
  validates :year, presence: true, inclusion: { in: YEARS }
  validates :assignment_id,
    uniqueness: { scope: [:semester, :year] }

  delegate :name, :problem, to: :assignment, prefix: true

  has_paper_trail

  def subject_name
    assignment.subject.to_s
  end

  private

  def denormalize_department
    self.department = assignment.course_department
  end
end
