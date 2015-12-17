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
      @_assessment ||= assessment_type.find(assessment_id)
    end

    def assessment_type
      params[:type]
    end

    def assessment_id
      params["#{assessment_type.model_name.singular}_id"]
    end
  end
end
