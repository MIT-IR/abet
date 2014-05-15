class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
    	t.references :subject
    	t.string "name" # e.g. Problem Set 3, Question 1
    	t.text "description" # e.g. a brief description of the topic or content of the question/assignment
    	t.integer "lower_bound" # numeric, minimum score on measure for a student to have satisfied
      t.integer "maximum" # numeric, total number of points possible
    	t.integer "goal" # numeric, 0 < goal <= 100; percent of students that should score at or above lower_bound
      	t.timestamps
    end
    add_index("measures", "subject_id")
  end
end
