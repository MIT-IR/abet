class AssessmentsController < ApplicationController
  def new
    @outcome = Outcome.find_by_id(params[:outcome_id])
  end
end
