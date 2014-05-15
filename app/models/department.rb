class Department < ActiveRecord::Base
	has_many :contacts
	has_many :courses
end
