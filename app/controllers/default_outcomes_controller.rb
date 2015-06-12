class DefaultOutcomesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    authorize(course, :create_outcomes?)
    if course.outcomes.empty?
      course.adopt_default_outcomes!
      redirect_to course, success: t(".success")
    else
      redirect_to course, error: t(".error")
    end
  end

  def show
    @outcomes = StandardOutcome.all
    @course = Course.find(params[:course_id])
    authorize(@course)
  end
end
