class DirectAssessment < ActiveRecord::Base
  default_scope { where("archived = false") }

  has_many :outcome_assessments, as: :assessment, dependent: :destroy
  has_many :outcomes, through: :outcome_assessments

  belongs_to :subject
  has_many :results, as: :assessment

  validates :description, presence: true
  validates :minimum_requirement, presence: true
  validates :name, presence: true
  validates :target_percentage, presence: true, inclusion: { in: 0..100 }
  validates :subject, presence: true
  validate :ensure_single_department

  has_paper_trail

  def department
    if outcomes.length > 0
      outcomes.first.department
    end
  end

  def to_s
    "#{name} - #{description}"
  end

  def archive
    update_attribute!(:archived, true)
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
