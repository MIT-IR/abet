class ManageAssessments::CoursesController < ApplicationController
  def show
    @course = CourseCoverage.new(course)
    authorize(@course)

    if @course.has_coverages?
      render :show
    else
      render :show_without_coverages
    end
  end

  def course
    policy_scope(Course).
      includes(outcomes: :outcome_coverages).
      includes(coverages: :subject).
      includes(outcome_coverages: [:assignment, :outcome]).
      find(params[:id])
  end
end
