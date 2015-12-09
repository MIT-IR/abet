class CreateAssessmentReports < ActiveRecord::Migration
  def change
    create_view :assessment_reports
  end
end
