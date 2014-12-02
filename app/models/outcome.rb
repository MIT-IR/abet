class Outcome < ActiveRecord::Base
	belongs_to :course
	has_many :direct_assessments
	has_many :indirect_assessments
	has_many :outcome_alignments
	accepts_nested_attributes_for :outcome_alignments
end