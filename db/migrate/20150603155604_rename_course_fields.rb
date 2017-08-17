class RenameCourseFields < ActiveRecord::Migration
  def change
    rename_column :courses, :course_name, :name
    rename_column :courses, :course_number, :number
  end
end
