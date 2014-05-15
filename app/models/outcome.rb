class Outcome < ActiveRecord::Base
	has_many :assessments
	belongs_to :course
end
