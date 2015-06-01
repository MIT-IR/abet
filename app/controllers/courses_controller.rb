class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @outcomes = @course.outcomes
    @unassociated_outcomes = retrieve_unassociated_outcomes
    redirect_to action: 'interstitial' if @outcomes.empty?
  end

  def interstitial
    @course = Course.find(params[:id])
  end

  def adopt_default
    @course = Course.find(params[:id])
    @course.adopt_default_outcomes!
    redirect_to action: 'show'
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
