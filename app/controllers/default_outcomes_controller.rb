class DefaultOutcomesController < ApplicationController
  before_action :ensure_adoptable

  def create
    course = Course.find(params[:course_id])
    authorize(course, :create_outcomes?)
    course.adopt_default_outcomes!
    redirect_to outcomes_dashboard_path, success: t(".success")
  end

  def index
    @outcomes = policy_scope(StandardOutcome)
    @course = course
  end

  private

  def course
    @_course ||= Course.find(params[:course_id])
  end

  def ensure_adoptable
    if course.outcomes_count > 0
      redirect_to outcomes_dashboard_path, error: t(".error")
    end
  end
end
