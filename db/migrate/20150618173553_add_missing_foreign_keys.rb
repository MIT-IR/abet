class AddMissingForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :outcomes, :courses
    add_index :courses, :department_id
  end
end
