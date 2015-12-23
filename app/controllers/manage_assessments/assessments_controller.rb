class ManageAssessments::AssessmentsController < ApplicationController
  def index
    @course = policy_scope(Course).find(params[:course_id])
    @outcomes = policy_scope(@course.outcomes).to_a
    @direct_assessments = DirectAssessment.
      for_course(@course).
      unarchived.
      includes(:subject, outcomes: :department)
    @indirect_assessments = IndirectAssessment.for_course(@course).unarchived

    if filter_to_outcomes.present?
      @direct_assessments = apply_outcome_filter_to(@direct_assessments)
      @indirect_assessments = apply_outcome_filter_to(@indirect_assessments)
      @filtered_outcome = Outcome.find_by_id(params[:outcome_ids])
    end
  end

  def new
    @outcome = Outcome.find_by_id(params[:outcome_id])
    authorize(@outcome, :create_assessments?)
  end

  private

  def filter_to_outcomes
    params[:outcome_ids]
  end

  def apply_outcome_filter_to(scope)
    scope = scope.for_outcomes(filter_to_outcomes)
  end
end
