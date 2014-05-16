class DepartmentsController < ApplicationController
  
  def index
    @departments = Department.sorted
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
