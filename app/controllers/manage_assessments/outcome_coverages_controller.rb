module ManageAssessments
  class OutcomeCoveragesController < ApplicationController
    def destroy
      outcome_coverage = OutcomeCoverage.find(params[:id])
      authorize(outcome_coverage)

      Archive.process(outcome_coverage: outcome_coverage)

      redirect_to manage_assessments_course_path(outcome_coverage.coverage.course)
    end
  end
end
