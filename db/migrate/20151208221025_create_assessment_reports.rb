class CreateAssessmentReports < ActiveRecord::Migration[4.2]
  def change
    create_view :assessment_reports
  end
end
