class AddAssignmentIdConstraintToResults < ActiveRecord::Migration[5.1]
  def change
    change_column_null :results, :assignment_id, false
  end
end
