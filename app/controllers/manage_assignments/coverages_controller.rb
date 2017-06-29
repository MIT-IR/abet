module ManageAssignments
  class CoveragesController < ApplicationController
    def new
      @coverage = course.coverages.build
      @coverage.outcome_coverages.build(outcome_id: params[:outcome_id])
      authorize(@coverage)
    end

    def edit
      @coverage = Coverage.find(params[:id])
      @coverage.outcome_coverages.build
      authorize(@coverage)
    end

    def create
      @coverage = course.coverages.build(dedupe_outcomes(new_coverage_params))
      authorize(@coverage)

      if @coverage.save
        redirect_to manage_assignments_course_path(course)
      else
        render :new
      end
    end

    def update
      @coverage = Coverage.find(params[:id])
      authorize(@coverage)

      if @coverage.update_attributes(dedupe_outcomes(edit_coverage_params))
        redirect_to manage_assignments_course_path(@coverage.course)
      else
        render :edit
      end
    end

    private

    def course
      @_course ||= policy_scope(Course).find(params[:course_id])
    end

    def new_coverage_params
      params.
        require(:coverage).
        permit(
          :subject_id,
          attachments_attributes: [:id, :file, :_destroy],
          outcome_coverages_attributes: [:outcome_id, :_destroy]
        )
    end

    def edit_coverage_params
      params.
        require(:coverage).
        permit(
          attachments_attributes: [:id, :file, :_destroy],
          outcome_coverages_attributes: [:outcome_id, :_destroy]
        )
    end

    def dedupe_outcomes(coverage_params)
      outcome_coverage_params = coverage_params[:outcome_coverages_attributes]
      coverage_params[:outcome_coverages_attributes] = unique_outcomes(outcome_coverage_params)

      coverage_params
    end

    def unique_outcomes(outcome_params)
      outcome_params.to_h.to_a.uniq { |_, value| value[:outcome_id] }.to_h
    end
  end
end
