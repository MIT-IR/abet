class Course < ActiveRecord::Base
	belongs_to :department
	has_many :outcomes
	has_many :contacts
end
