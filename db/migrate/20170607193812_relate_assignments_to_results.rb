class RelateAssignmentsToResults < ActiveRecord::Migration[5.1]
  def change
    add_reference :results, :assignment, foreign_key: true
    add_index :results, [:assignment_id, :year, :semester], unique: true

    change_column_null :results, :assessment_id, true
    change_column_null :results, :assessment_name, true
    change_column_null :results, :assessment_description, true

    drop_view :assessment_reports, revert_to_version: 3
    create_view :assignment_reports
  end
end
