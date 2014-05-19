class DepartmentsController < ApplicationController
  
  def index
    @departments = Department.sorted
  end

  def show
    @department = Department.find(params[:id])
    @courses = Course.where(department_id: Department.find(params[:id]))
    #@departments.courses.find(params[:id])

    #Course.find(Department.find(1))

  end

  def new
  end

  def edit
  end

  def delete
  end
end
