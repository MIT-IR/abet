class ResultsController < ApplicationController
  def new
    @assessment = DirectAssessment.find(params[:direct_assessment_id])
    @result = @assessment.results.build
    authorize(@result)
  end

  def create
    @assessment = DirectAssessment.find(params[:direct_assessment_id])
    @result = @assessment.results.build(result_params)
    authorize(@result)

    if @result.save
      redirect_to direct_assessment_path(@assessment)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(
      :assessment_description,
      :assessment_name,
      :percentage,
      :problem_description,
      :semester,
      :year
    )
  end
end
