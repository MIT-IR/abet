class DirectAssessmentsController < ApplicationController
  include AssessmentAuthorization

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.direct_assessments.build
    authorize(@assessment)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @direct_assessment = @outcome.direct_assessments.build(direct_assessment_params)
    authorize(@direct_assessment)

    if @direct_assessment.save
      redirect_to outcome_path(@outcome)
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
      redirect_to outcome_path(@assessment.outcome)
    else
      render :edit
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
