class StandardOutcome < ActiveRecord::Base

	def self.retrieve_defaults
		self.all
	end
end