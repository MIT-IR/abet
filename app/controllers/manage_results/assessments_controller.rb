class ManageResults::AssessmentsController < ApplicationController
  before_action :ensure_active_assessment

  def show
    @assessment = assessment
    authorize(@assessment)
  end

  private

  def assessment
    @_assessment ||= Assessment.
      includes(results: :assessment).
      includes(outcomes: :department).
      find(params[:id])
  end

  def ensure_active_assessment
    if assessment.archived?
      flash[:html_safe] = true
      redirect_to(
        manage_results_subject_path(assessment.subject_id),
        success: t(".success", name: assessment.name, undo: undo_link(assessment)),
      )
    end
  end

  def undo_link(assessment)
    view_context.link_to(
      t(".undo"),
      manage_assessments_assessment_archive_path(assessment_id: assessment.id),
      method: :delete
    )
  end
end
