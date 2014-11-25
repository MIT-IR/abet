class OutcomesController < ApplicationController
	def show
		@outcome = Outcome.find(params[:id])
		@direct_assessments = @outcome.direct_assessments
		@indirect_assessments = @outcome.indirect_assessments
	end
end