class Course < ActiveRecord::Base
	belongs_to :department
	has_many :outcomes
	has_many :contacts
	scope :sorted, lambda {order("courses.number ASC")}
end
