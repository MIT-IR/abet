class ManageAssessments::DashboardController < ApplicationController
  def show
    @courses = policy_scope(Course)
    authorize(:generic, :view_assessments?)
  end
end
