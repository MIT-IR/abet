class Alignment < ActiveRecord::Base
  LEVELS = ["Low alignment", "Moderate alignment", "High alignment"].freeze

  belongs_to :outcome
  belongs_to :standard_outcome
end
