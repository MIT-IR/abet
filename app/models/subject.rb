class Subject < ActiveRecord::Base
	belongs_to :assessment
	has_many :measures
	has_many :subject_instructors
	has_many :instructors, :through => :subject_instructors, :class_name => "Contact"
end
