class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string "number", :null => false # e.g. 6.004
    	t.string "name" # e.g. "Introduction to Algorithms"
    	t.references :assessment
        t.timestamps
    end
    add_index("subjects", "assessment_id")
  end
end
