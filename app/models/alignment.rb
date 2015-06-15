class Alignment < ActiveRecord::Base
  LOW = "Low alignment".freeze
  MODERATE = "Moderate alignment".freeze
  HIGH = "High alignment".freeze
  LEVELS = [LOW, MODERATE, HIGH].freeze

  belongs_to :outcome
  belongs_to :standard_outcome
end
