class DirectAssessmentsController < ApplicationController
	def new
		@outcome = Outcome.find(params[:outcome_id])
		@assessment = DirectAssessment.new
		@available_semesters = ['2015FA', '2015JA', '2015SP']
	end
	def create
		@outcome = Outcome.find(params[:outcome_id])
		@assessment = DirectAssessment.create direct_assessment_params
		@assessment.save
		if @assessment.save
			redirect_to outcome_path(@outcome)
		end
	end

	private

	def direct_assessment_params
		params.require(:direct_assessment).permit(:subject_number, :subject_description,
			:semester, :assignment_name, :assignment_description, :minimum_grade, 
			:target_percentage,	:actual_percentage, :outcome_id)
	end
end