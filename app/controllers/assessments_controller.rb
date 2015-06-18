class AssessmentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @outcomes = policy_scope(@course.outcomes)
  end

  def new
    @outcome = Outcome.find_by_id(params[:outcome_id])
    authorize(@outcome, :create_assessments?)
  end
end
