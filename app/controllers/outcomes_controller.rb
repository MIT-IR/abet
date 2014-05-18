class OutcomesController < ApplicationController
  def index
  end

  def show
    @course = Course.find(params[:course_id])
    @department = @course.department
    @outcome = Outcome.find(params[:id])
    @assessments = Assessment.where(outcome_id: params[:id])
    @subjects = []
    @show_flags = []
    @assessments.each do |assess|
      @subjects << assess.subjects
      assess.subjects.each do |sub|
        if sub.measures.size != 0
          @show_flags << true
        else
          @show_flags << false
        end
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
