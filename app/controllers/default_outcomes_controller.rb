class DefaultOutcomesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    authorize(course, :create_outcomes?)

    Adoption.process(adoptable_outcomes, course: course)
    redirect_to redirect_path, success: t(
      ".success",
      count: adoptable_outcomes.size
    )
  end

  def index
    @outcomes = policy_scope(StandardOutcome)
    @course = course
  end

  private

  def course
    @_course ||= Course.find(params[:course_id])
  end

  def adoptable_outcomes
    @_adoptable_outcomes ||= StandardOutcome.where(id: params[:ids])
  end

  def redirect_path
    if adoptable_outcomes.size > 1
      outcomes_dashboard_path
    else
      course_outcomes_path(course)
    end
  end
end
