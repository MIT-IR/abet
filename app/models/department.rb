class Department < ActiveRecord::Base
	has_many :contacts
	has_many :courses

	scope :sorted, lambda {order("departments.sort_num ASC")}
end
