class CoursesController < ApplicationController
  def index
    @courses = Course.sorted
  end

  def show
    @course = Course.find(params[:id])
    @department = @course.department
    @outcomes = Course.find(params[:id]).outcomes
  end

  def new
  end

  def edit
  end

  def delete
  end
end
