class RenameCourseFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :courses, :course_name, :name
    rename_column :courses, :course_number, :number
  end
end
