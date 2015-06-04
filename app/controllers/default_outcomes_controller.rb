class DefaultOutcomesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    course.adopt_default_outcomes!
    redirect_to course
  end
end
