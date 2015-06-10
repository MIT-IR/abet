class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @outcomes = @course.outcomes
    @unassociated_outcomes = retrieve_unassociated_outcomes
    authorize(@course)
  end

  private

  def retrieve_unassociated_outcomes
    return [] unless @course.has_custom_outcomes?
    StandardOutcome.unaligned_with(@course)
  end
end
