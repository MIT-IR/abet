class ManageAssignments::DashboardController < ApplicationController
  before_action :redirect_to_course_coverage, if: :has_access_to_one_course?

  def show
    @courses = courses
    authorize(:generic, :view_assignments?)
  end

  private

  def courses
    @_courses ||= policy_scope(Course.includes(:outcome_coverages).with_outcomes).map do |course|
      CourseCoverage.new(course)
    end
  end

  def has_access_to_one_course?
    courses.length == 1
  end

  def redirect_to_course_coverage
    redirect_to manage_assignments_course_path(courses.first)
  end
end
