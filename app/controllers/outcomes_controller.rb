class OutcomesController < ApplicationController
  def index
  end

  def show
    @course = Course.find(params[:course_id])
    @outcome = Outcome.find(params[:id])
    @assessments = Assessment.where(outcome_id: params[:id])
    @subjects = []
    @assessments.each do |assess|
      @subjects << assess.subjects
    end
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
