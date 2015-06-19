class AssessmentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @outcomes = policy_scope(@course.outcomes)
  end
end
