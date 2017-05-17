module ManageAssessments
  class CoveragesController < ApplicationController
    def new
      @coverage = course.coverages.build
      authorize(@coverage)
    end

    def create
      @coverage = course.coverages.build(coverages_params)
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

    def coverages_params
      params.require(:coverage).permit(:subject_id, :outcome_id)
    end
  end
end
