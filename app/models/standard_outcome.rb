class StandardOutcome < ActiveRecord::Base
	has_and_belongs_to_many :outcomes, :join_table => :outcomes_alignment
	def self.retrieve_defaults
		self.all
	end
end