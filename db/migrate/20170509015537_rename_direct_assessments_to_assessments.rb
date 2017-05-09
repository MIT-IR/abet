class RenameDirectAssessmentsToAssessments < ActiveRecord::Migration[5.0]
  def up
    rename_table :direct_assessments, :assessments
    update_view :assessment_reports, version: 2
    update_view :outcomes_with_metadata, version: 3
  end

  def down
    rename_table :assessments, :direct_assessments
    update_view :assessment_reports, version: 1
    update_view :outcomes_with_metadata, version: 2
  end
end
