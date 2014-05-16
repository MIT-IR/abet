class CreateMeasures < ActiveRecord::Migration
  def up
    create_table :measures do |t|
    	t.references :subject
    	t.string "name" # e.g. Problem Set 3, Question 1
    	t.text "description" # e.g. a brief description of the topic or content of the question/assignment
    	t.integer "lower_bound" # numeric, minimum score on measure for a student to have satisfied
      t.integer "maximum" # numeric, total number of points possible
    	t.integer "goal" # number between 0 and 100; percent of students who *should* score at or above lower_bound
      t.integer "actual" # number between 0 and 100, percent of students who met the goal from the measure
      t.text "year" # academic year
      t.text "semester" # Fall or Spring (possibly IAP or Summer too)
      t.references :contact #person who provided the scores, not necessarily same as person who entered (e.g., a TA could have tabulated the scores and sent them to the AO who entered them)
      t.timestamps
    end
    add_index("measures", "subject_id")
    add_index("measures", "contact_id")
  end
  def down
    drop_table :measures
  end
end
