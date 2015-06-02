class StandardOutcome < ActiveRecord::Base
  NO_ALIGNMENT = "No alignment"
  LOW_ALIGNMENT = "Low alignment"
  MODERATE_ALIGNMENT = "Moderate alignment"
  HIGH_ALIGNMENT = "High alignment"

  def self.alignment_levels
    [
      NO_ALIGNMENT,
      LOW_ALIGNMENT,
      MODERATE_ALIGNMENT,
      HIGH_ALIGNMENT
    ]
  end

  has_many :outcome_alignments
  accepts_nested_attributes_for :outcome_alignments
  def self.retrieve_defaults
    self.all
  end
end
