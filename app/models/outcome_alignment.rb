class OutcomeAlignment < ActiveRecord::Base
	belongs_to :outcome
	belongs_to :standard_outcome
end
