class DirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment, dependent: :destroy
  has_many :outcomes, -> { order(:name) }, through: :outcome_assessments
  has_many :courses, -> { order(:id) }, through: :outcomes

  belongs_to :subject
  has_many :results, as: :assessment

  validates :description, presence: true
  validates :minimum_requirement, presence: true
  validates :name, presence: true
  validates :target_percentage, presence: true, inclusion: { in: 0..100 }
  validates :subject, presence: true
  validate :ensure_single_department

  has_paper_trail

  def self.unarchived
    where(archived: false)
  end

  def department
    if outcomes.length > 0
      outcomes.first.department
    end
  end

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
