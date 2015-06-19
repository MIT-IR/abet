class ManageOutcomes::DashboardController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def show
    courses = policy_scope(Course)
    @outcomes_dashboard = OutcomesDashboard.new(courses)
  end
end
