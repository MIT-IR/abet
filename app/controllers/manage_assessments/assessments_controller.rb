class ManageAssessments::AssessmentsController < ApplicationController
  def index
    @course = policy_scope(Course).find(params[:course_id])
    @outcomes = policy_scope(@course.outcomes).to_a
    @direct_assessments = DirectAssessment.
      for_course(@course).
      unarchived.
      includes(:subject, outcomes: :department)

    if filter_to_outcomes.present?
      @direct_assessments = apply_outcome_filter_to(@direct_assessments)
      @filtered_outcome = Outcome.find_by_id(params[:outcome_ids])
    end
  end

  private

  def filter_to_outcomes
    params[:outcome_ids]
  end

  def apply_outcome_filter_to(scope)
    scope = scope.for_outcomes(filter_to_outcomes)
  end
end
