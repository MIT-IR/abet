class DirectAssessmentsController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.direct_assessments.build
    authorize(@outcome)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.direct_assessments.build(direct_assessment_params.merge(department_id: @outcome.department.id))
    authorize(@outcome)

    if @outcome.save
      redirect_to outcome_path(@outcome), success: t(".success")
    else
      render :new
    end
  end

  def edit
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  def update
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)

    @assessment.assign_attributes(direct_assessment_params)
    if @assessment.save
      redirect_to outcome_path(@assessment.outcomes.first), success: t(".success")
    else
      render :edit, success: t(".success")
    end
  end

  def show
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  private

  def direct_assessment_params
    params.require(:direct_assessment).permit(
      :actual_percentage,
      :department_id,
      :description,
      :minimum_requirement,
      :name,
      :problem_description,
      :semester,
      :subject_id,
      :target_percentage
    )
  end
end
