class DirectAssessmentsController < ApplicationController
	def new
		@assessment = DirectAssessment.new
		@available_semesters = ['2015FA', '2015JA', '2015SP']
	end
end