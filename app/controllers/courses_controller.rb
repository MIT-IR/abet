class CoursesController < ApplicationController
  def index
    @courses = Course.sorted
  end

  def show
    @course = Course.find(params[:id])
    @department = @course.department
    @outcomes = Course.find(params[:id]).outcomes
    @show_flags = []
    @outcomes.each do |out|
      if out.assessments.size != 0
        @show_flags << true
      else
        @show_flags << false
      end
    end
  end

  def new
  end

  def edit
  end

  def delete
  end
end
