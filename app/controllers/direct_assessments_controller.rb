class DirectAssessmentsController < ApplicationController
	def new
		@outcome = Outcome.find(params[:outcome_id])
		@assessment = DirectAssessment.new
		@available_semesters = ['2015FA', '2015JA', '2015SP']
	end
	def create
		if DirectAssessment.create!(params[:direct_assessment])
			redirect_to outcomes_path(DirectAssessment.find(params[:id]).outcome)
		end
	end
end