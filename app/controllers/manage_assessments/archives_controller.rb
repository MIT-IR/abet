module ManageAssessments
  class ArchivesController < ApplicationController
    def create
      assessment = DirectAssessment.find(params[:direct_assessment_id])
      authorize(assessment, :update?)
      assessment.update_attributes(archived: true)
      redirect_to_back_or_default root_path, success: t(".success")
    end
  end
end
