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
    @assessment.archived = 'true'
    @assessment.save
    @subject = @assessment.subject
  end
end
