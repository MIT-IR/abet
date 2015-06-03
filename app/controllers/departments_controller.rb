class DepartmentsController < ApplicationController
  after_action :verify_authorized

  def show
    @department = Department.find(params[:id])
    @courses = @department.courses
    authorize(@department)
  end
end
