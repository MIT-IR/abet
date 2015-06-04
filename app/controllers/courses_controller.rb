class CoursesController < ApplicationController
  after_filter :verify_authorized, only: [:show]

  def show
    @course = Course.find(params[:id])
    @outcomes = @course.outcomes
    @unassociated_outcomes = retrieve_unassociated_outcomes
    authorize(@course)
  end

  private

  def retrieve_unassociated_outcomes
    return [] unless @course.has_custom_outcomes?
    standard_ids = @course.outcomes.map do |outcome|
      outcome.outcome_alignments.map do |alignment|
        alignment.standard_outcome_id
      end.flatten
    end.flatten.uniq
    return [] if standard_ids.count == 0
    return StandardOutcome.where.not(id: standard_ids)
  end
end
