class IndirectAssessment < ActiveRecord::Base
  has_many :outcome_assessments, as: :assessment
  has_many :outcomes, -> { order(:name) }, through: :outcome_assessments
  has_many :courses, -> { order(:id) }, through: :outcomes
  has_many :results, as: :assessment

  validates :description, presence: true
  validates :minimum_requirement, presence: true
  validates :name, presence: true
  validates :target_percentage, presence: true, inclusion: { in: 0..100 }

  def department
    outcomes.first.department
  end

  has_paper_trail

  def to_s
    "#{name} - #{description}"
  end

  def archive
    update!(archived: true)
  end

  def unarchive
    update!(archived: false)
  end
end
