class SubjectInstructor < ActiveRecord::Base
	belongs_to :subject 
	belongs_to :instructor, :class_name => "Contact", :foreign_key => "contact_id"
end
