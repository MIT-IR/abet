class AddMissingForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :outcomes, :courses
    add_index :courses, :department_id
  end
end
