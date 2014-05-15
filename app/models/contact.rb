class Contact < ActiveRecord::Base
	belongs_to :department
	belongs_to :course
	has_many :data_entries
	has_many :subjects, :through => :subject_instructors
	has_many :subject_instructors
end
