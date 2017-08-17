class AddOutcomesConstraints < ActiveRecord::Migration[4.2]
  def change
    change_column_null :outcomes, :name, false
    change_column_null :outcomes, :description, false
    change_column_null :outcomes, :course_id, false

    add_index :outcomes, [:course_id, :name], unique: true
  end
end
