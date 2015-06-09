class IndirectAssessmentsController < ApplicationController
  include AssessmentAuthorization

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.indirect_assessments.build(type: params[:type])
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
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
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
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

  private

  def assessment_params
    params.require(:indirect_assessment).permit(
      :actual_percentage,
      :assessment_description,
      :assessment_name,
      :target_percentage,
      :type,
      :year
    )
  end
end
