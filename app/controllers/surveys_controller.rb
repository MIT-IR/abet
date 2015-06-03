class SurveysController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @survey = Survey.new
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @survey = @outcome.surveys.build(survey_params)

    if @survey.save
      redirect_to outcome_path(@outcome)
    else
      render :new
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
