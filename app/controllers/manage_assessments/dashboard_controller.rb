class ManageAssessments::DashboardController < ApplicationController
  def show
    @courses = policy_scope(Course.includes(:outcomes_with_metadata))
    authorize(:generic, :view_assessments?)

    if @courses.length == 1
      redirect_to manage_assessments_course_assessments_path(@courses.first.id)
    end
  end
end
