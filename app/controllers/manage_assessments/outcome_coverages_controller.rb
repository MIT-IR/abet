module ManageAssessments
  class OutcomeCoveragesController < ApplicationController
    def new
      course = Course.find(params[:course_id])
      @outcome_coverage = course.outcome_coverages.build
      authorize(@outcome_coverage)
    end

    def create
      course = Course.find(params[:course_id])
      @outcome_coverage = course.outcome_coverages.build(outcome_coverages_params)
      authorize(@outcome_coverage)

      if @outcome_coverage.save
        redirect_to manage_assessments_course_outcome_coverages_path
      else
        render :new
      end
    end

    def index
      @course = policy_scope(Course).find(params[:course_id])
    end

    private

    def outcome_coverages_params
      params.require(:outcome_coverage).permit(:subject_id, :outcome_id)
    end
  end
end
