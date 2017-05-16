class ManageAssessments::CoursesController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def index
    @courses = policy_scope(Course).includes(outcomes: :department)
  end

  def show
    @course = policy_scope(Course).
      includes(outcome_coverages: [:subject, :outcome]).
      find(params[:id])
  end
end
