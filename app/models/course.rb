class Course < ActiveRecord::Base
	belongs_to :department
	has_many :outcomes
end