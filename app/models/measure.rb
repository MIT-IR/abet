class Measure < ActiveRecord::Base
	belongs_to :subject
	has_many :data_entries
end
