class ManageAssessments::IndirectAssessmentsController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.indirect_assessments.build(type: params[:type])
    authorize(@outcome)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.indirect_assessments.build(assessment_params)
    authorize(@outcome)

    if @outcome.save
      redirect_to manage_results_indirect_assessment_path(@assessment),
        success: t(".success")
    else
      render :new
    end
  end

  def edit
    @assessment = IndirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  def update
    @assessment = IndirectAssessment.find(params[:id])
    @assessment.assign_attributes(assessment_params)
    authorize(@assessment)

    if @assessment.save
      redirect_to manage_results_indirect_assessment_path(@assessment),
        success: t(".success")
    else
      render :edit
    end
  end

  private

  def assessment_params
    params.require(:indirect_assessment).permit(
      :actual_percentage,
      :description,
      :minimum_requirement,
      :name,
      :survey_question,
      :target_percentage,
      :type,
      :year
    )
  end
end
