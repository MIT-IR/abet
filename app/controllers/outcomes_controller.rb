class OutcomesController < ApplicationController
  def index
  end

  def show
    @courses = Course.find(params[:id])
    @outcomes = Outcome.where(course_id: Course.find(params[:id]))

    #@departments = Department.find(params[:id])
    #@courses = Course.where(department_id: Department.find(params[:id]))
  end

  def new
  end

  def edit
  end

  def delete
  end
end
