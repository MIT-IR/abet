class OutcomesController < ApplicationController
	def show
		@outcome = Outcome.find(params[:id])
		@direct_assessments = @outcome.direct_assessments
		@indirect_assessments = @outcome.indirect_assessments
	end
	def create
		@course = Course.find(params[:outcome][:course_id])
		@outcome = @course.outcomes.build(outcome_params)
		if @outcome.save
			redirect_to match_to_standard_outcome_path(@outcome)
		end
	end
	def match_to_standard
		@outcome = Outcome.find(params[:id])
		@defaults = StandardOutcome.all
		@defaults.each do |d|
			unless @outcome.standard_outcomes.include?(d)
				@outcome.standard_outcomes << d
			end
		end
		@std_outcomes = @outcome.standard_outcomes
		@align_levels = ['No alignment','Low alignment','Moderate alignment','High alignment']
	end

	private

	def outcome_params
		params.require(:outcome).permit(:name,:description)
	end
end