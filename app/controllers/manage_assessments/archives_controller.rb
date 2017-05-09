module ManageAssessments
  class ArchivesController < ApplicationController
    def create
      authorize(assessment, :update?)
      assessment.archive

      flash[:html_safe] = true
      redirect_back(
        fallback_location: root_path,
        success: t(".success", name: assessment.name, undo: undo_link(assessment)),
      )
    end

    def destroy
      authorize(assessment, :update?)
      assessment.unarchive

      redirect_back(
        fallback_location: root_path,
        success: t(".success", name: assessment.name),
      )
    end

    private

    def assessment
      @_assessment ||= Assessment.find(params[:assessment_id])
    end

    def undo_link(assessment)
      view_context.link_to(t(".undo"), undo_href(assessment), method: :delete)
    end

    def undo_href(assessment)
      manage_assessments_assessment_archive_path(
        direct_assessment_id: assessment.id,
      )
    end
  end
end
