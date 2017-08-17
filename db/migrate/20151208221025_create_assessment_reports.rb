class CreateAssessmentReports < ActiveRecord::Migration[5.1]
  def change
    create_view :assessment_reports
  end
end
