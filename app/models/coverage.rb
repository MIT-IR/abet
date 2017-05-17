class Coverage < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject, required: true

  has_many :outcome_coverages
  has_many :outcomes, through: :outcome_coverages

  accepts_nested_attributes_for :outcome_coverages,
    allow_destroy: true,
    reject_if: :all_blank

  validates :subject_id, presence: true
  validate :must_have_outcomes

  private

  def must_have_outcomes
    if outcome_coverages.empty? || all_outcome_coverages_marked_for_destruction?
      errors.add(:base, :outcomes_required)
    end
  end

  def all_outcome_coverages_marked_for_destruction?
    outcome_coverages.all? do |outcome_coverage|
      outcome_coverage.marked_for_destruction?
    end
  end
end
