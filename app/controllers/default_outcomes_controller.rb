class DefaultOutcomesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    authorize(course, :create_outcomes?)
    course.adopt_default_outcomes!
    redirect_to course
  end
end
