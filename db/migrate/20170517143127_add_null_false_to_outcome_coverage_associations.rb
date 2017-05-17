class AddNullFalseToOutcomeCoverageAssociations < ActiveRecord::Migration[5.0]
  def change
    change_column_null :outcome_coverages, :course_id, false
    change_column_null :outcome_coverages, :outcome_id, false
    change_column_null :outcome_coverages, :subject_id, false
  end
end
