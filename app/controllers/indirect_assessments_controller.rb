class IndirectAssessmentsController < ApplicationController
  include AssessmentAuthorization

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.indirect_assessments.build(type: params[:type])
    authorize(@assessment)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.indirect_assessments.build(assessment_params)
    authorize(@assessment)

    if @assessment.save
      redirect_to outcome_path(@outcome)
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
      redirect_to outcome_path(@assessment.outcome)
    else
      render :edit
    end
  end

  def show
    @assessment = IndirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  private

  def assessment_params
    params.require(:indirect_assessment).permit(
      :actual_percentage,
      :description,
      :name,
      :target_percentage,
      :type,
      :year
    )
  end
end
