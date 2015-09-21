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
    redirect_to manage_results_subject_path(@subject)
  end
end
