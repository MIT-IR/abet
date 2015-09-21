class ManageResults::DirectAssessmentsController < ApplicationController
  def show
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  def edit
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  def update
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
    @subject = @assessment.parent
  end
end
