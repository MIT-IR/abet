class Assessment < ActiveRecord::Base

	has_many :subjects
	belongs_to :outcome
end
