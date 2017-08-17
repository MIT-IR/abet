class AddCourseConstraints < ActiveRecord::Migration[4.2]
  def change
    change_column_null :courses, :name, false
    change_column_null :courses, :number, false
    change_column_null :courses, :department_id, false
    add_index :courses, :number, unique: true
    add_foreign_key :courses, :departments, on_delete: :restrict
  end
end
