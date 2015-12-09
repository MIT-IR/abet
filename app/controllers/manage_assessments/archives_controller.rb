module ManageAssessments
  class ArchivesController < ApplicationController
    def create
      authorize(assessment, :update?)
      assessment.archive
      redirect_to_back_or_default root_path, success: t(".success")
    end

    def destroy
      authorize(assessment, :update?)
      assessment.unarchive
      redirect_to_back_or_default root_path, success: t(".success")
    end

    private

    def assessment
      @_assessment ||= DirectAssessment.find(params[:direct_assessment_id])
    end
  end
end
