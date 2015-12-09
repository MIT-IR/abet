module Reports
  class AssessmentReportsController < ApplicationController
    def show
      @course = Course.find(params[:course_id])
      authorize(@course, :manage_assessments?)
      @reports = AssessmentReport.for(@course)

      respond_to do |format|
        format.html
        format.csv do
          send_data(
            @reports.to_csv,
            type: "text/csv",
            filename: "#{@course.name.parameterize}-assessment-report.csv"
          )
        end
      end
    end
  end
end
