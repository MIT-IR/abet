module Reports
  class AssignmentReportsController < ApplicationController
    def show
      @course = Course.find(params[:course_id])
      authorize(@course, :manage_assignments?)
      @reports = AssignmentReport.for(@course)

      respond_to do |format|
        format.html
        format.csv do
          send_data(
            @reports.to_csv,
            type: "text/csv",
            filename: "#{@course.name.parameterize}-assignment-report.csv"
          )
        end
      end
    end
  end
end
