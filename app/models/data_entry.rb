class DataEntry < ActiveRecord::Base
	belongs_to :measure
	belongs_to :contact
end
