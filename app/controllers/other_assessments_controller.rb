class OtherAssessmentsController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @other_assessment = OtherAssessment.new
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @other_assessment = @outcome.other_assessments.build(other_assessment_params)

    if @other_assessment.save
      redirect_to outcome_path(@outcome)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:outcome_id])
    @other_assessment = OtherAssessment.find(params[:id])
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
  end

  def update
    @outcome = Outcome.find(params[:outcome_id])
    @other_assessment = OtherAssessment.find(params[:id])
    @other_assessment.assign_attributes(other_assessment_params)

    if @other_assessment.save
      redirect_to outcome_path(@outcome)
    else
      render :edit
    end
  end

  private

  def other_assessment_params
    params.require(:other_assessment).permit(
      :actual_percentage,
      :assessment_description,
      :assessment_name,
      :target_percentage,
      :year
    )
  end
end
