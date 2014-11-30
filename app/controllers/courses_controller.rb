class CoursesController < ApplicationController
	def show
		@course = Course.find(params[:id])
		@outcomes = @course.outcomes
		redirect_to action: 'interstitial' if @outcomes.empty?
	end
	def interstitial
		@course = Course.find(params[:id])
	end
	def adopt_default
		@course = Course.find(params[:id])
		defaults = StandardOutcome.retrieve_defaults || []
		defaults.each do |outcome|
			Outcome.create(name: outcome.name, 
				description: outcome.description, 
				course: @course, standard_outcome_id: outcome.id)
		end

		redirect_to action: 'show'
	end
	def custom_outcomes
		@course = Course.find(params[:id])
		@defaults = StandardOutcome.retrieve_defaults || []
		@outcome = Outcome.new
	end
end