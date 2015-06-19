class ResultsController < ApplicationController
  def new
    @assessment = find_assessment
    @result = @assessment.results.build(assessment_attributes)
    authorize(@result)
  end

  def create
    @assessment = find_assessment
    @result = @assessment.results.build(result_params)
    authorize(@result)

    if @result.save
      redirect_to @result.assessment, success: t(".success")
    else
      render :new
    end
  end

  def edit
    @result = Result.find(params[:id])
    authorize(@result)
  end

  def update
    @result = Result.find(params[:id])
    authorize(@result)

    if @result.update(result_params)
      redirect_to @result.assessment, success: t(".success")
    else
      render :edit
    end
  end

  def destroy
    result = Result.find(params[:id])
    authorize(result)

    result.destroy!
    redirect_to result.assessment, success: t(".success")
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

  def find_assessment
    if params[:direct_assessment_id]
      @assessment = DirectAssessment.find(params[:direct_assessment_id])
    else
      @assessment = IndirectAssessment.find(params[:indirect_assessment_id])
    end
  end

  def assessment_attributes
    {
      assessment_name: @assessment.name,
      assessment_description: @assessment.description,
      problem_description: @assessment.try(:problem_description)
    }.compact
  end
end
