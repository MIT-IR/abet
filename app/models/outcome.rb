class Outcome < ActiveRecord::Base
	belongs_to :course
	has_many :direct_assessments
	has_many :indirect_assessments
	has_and_belongs_to_many :standard_outcomes, :join_table => :outcomes_alignment
end