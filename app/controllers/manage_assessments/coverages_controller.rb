module ManageAssessments
  class CoveragesController < ApplicationController
    def new
      @coverage = course.coverages.build
      @coverage.attachments.build
      @coverage.outcome_coverages.build(outcome_id: params[:outcome_id])
      authorize(@coverage)
    end

    def create
      @coverage = course.coverages.build(coverage_params)
      authorize(@coverage)

      if @coverage.save
        redirect_to manage_assessments_course_path(course)
      else
        render :new
      end
    end

    private

    def course
      @_course ||= policy_scope(Course).find(params[:course_id])
    end

    def coverage_params
      params.
        require(:coverage).
        permit(
          :subject_id,
          attachments_attributes: [:file],
          outcome_coverages_attributes: [:coverage_id, :outcome_id],
        )
    end
  end
end
