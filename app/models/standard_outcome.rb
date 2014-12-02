class StandardOutcome < ActiveRecord::Base
	has_many :outcome_alignments
	accepts_nested_attributes_for :outcome_alignments
	def self.retrieve_defaults
		self.all
	end
end