class DirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment
  has_many :outcomes, through: :outcome_assessments

  belongs_to :subject
  has_many :results, as: :assessment

  validates :subject, presence: true
  validate :ensure_single_department

  def department
    outcomes.first.department
  end

  has_paper_trail

  def to_s
    "#{name} - #{description}"
  end

  private

  def department_ids
    Outcome.
      where(id: outcome_ids).
      joins(course: :department).
      uniq.
      pluck("departments.id")
  end

  def ensure_single_department
    unless department_ids.length == 1
      errors.add(:base, :single_department)
    end
  end
end
