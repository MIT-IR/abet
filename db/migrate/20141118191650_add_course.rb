class AddCourse < ActiveRecord::Migration
  def change
    create_table "courses" do |t|
      t.string "course_number"
      t.string "course_name"
      t.integer "department_id"
    end
  end
end
