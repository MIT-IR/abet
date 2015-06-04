class AssessmentsController < ApplicationController
  after_filter :verify_authorized

  def new
    @outcome = Outcome.find_by_id(params[:outcome_id])
    authorize(@outcome, :create_assessments?)
  end
end
