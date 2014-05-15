class CreateSubjectInstructors < ActiveRecord::Migration
  def change
    create_table :subject_instructors do |t|
    	t.references :subject
    	t.references :contact
    	t.string "semester" # semester that the instructor was responsible for that subject, e.g. 2013FA
      	t.timestamps
    end
    add_index :subject_instructors, ["subject_id", "contact_id"]
  end
end
