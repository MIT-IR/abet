class ParticipationsController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @participation = Participation.new
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @participation = @outcome.participations.build(participation_params)

    if @participation.save
      redirect_to outcome_path(@outcome)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:outcome_id])
    @participation = Participation.find(params[:id])
    @available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
  end

  def update
    @outcome = Outcome.find(params[:outcome_id])
    @participation = Participation.find(params[:id])
    @participation.assign_attributes(participation_params)

    if @participation.save
      redirect_to outcome_path(@outcome)
    else
      render :edit
    end
  end

  private

  def participation_params
    params.require(:participation).permit(
      :actual_percentage,
      :assessment_description,
      :assessment_name,
      :target_percentage,
      :year
    )
  end
end
