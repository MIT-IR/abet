class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])
    @courses = @department.courses
  end
end
