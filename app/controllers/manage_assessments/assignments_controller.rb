class ManageAssessments::AssignmentsController < ApplicationController
  def new
    @assignment = outcome_coverage.build_assignment
    authorize(@assignment)
  end

  def create
    @assignment = outcome_coverage.build_assignment(assignment_params)
    authorize(@assignment)

    if @assignment.save
      redirect_to manage_assessments_course_path(outcome_coverage.coverage.course),
        success: t(".success", label: outcome_coverage.outcome.label)
    else
      render :new
    end
  end

  private

  def outcome_coverage
    @_outcome_coverage ||= OutcomeCoverage.find(params[:outcome_coverage_id])
  end

  def assignment_params
    params.require(:assignment).permit(
      :name,
      :problem,
      attachments_attributes: [:id, :file, :_destroy],
    )
  end
end
