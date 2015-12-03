class ManageAssessments::CoursesController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def index
    @courses = policy_scope(Course).includes(outcomes: :department)
  end
end
