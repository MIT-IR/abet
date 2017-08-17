class AddMissingForeignKeys < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key :outcomes, :courses
    add_index :courses, :department_id
  end
end
