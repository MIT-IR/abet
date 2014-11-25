class Outcome < ActiveRecord::Base
	belongs_to :course
	has_many :direct_assessments
	has_many :indirect_assessments
end