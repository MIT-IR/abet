class ManageAssessments::DashboardController < ApplicationController
  def show
    @courses = policy_scope(Course.includes(:outcomes_with_metadata))
    authorize(:generic, :view_assessments?)
  end
end
