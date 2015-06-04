class SurveysController < ApplicationController
  include AssessmentAuthorization
  include AssessmentCloning

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @survey = @outcome.surveys.build(new_assessment_attributes)
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
    authorize(@survey)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @survey = @outcome.surveys.build(survey_params)
    authorize(@survey)

    if @survey.save
      redirect_to outcome_path(@outcome)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:outcome_id])
    @survey = Survey.find(params[:id])
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
    authorize(@survey)
  end

  def update
    @outcome = Outcome.find(params[:outcome_id])
    @survey = Survey.find(params[:id])
    @survey.assign_attributes(survey_params)
    authorize(@survey)

    if @survey.save
      redirect_to outcome_path(@outcome)
    else
      render :edit
    end
  end

  private

  def survey_params
    params.require(:survey).permit(
      :actual_percentage,
      :assessment_description,
      :assessment_name,
      :minimum_category,
      :survey_question,
      :target_percentage,
      :year
    )
  end
end
