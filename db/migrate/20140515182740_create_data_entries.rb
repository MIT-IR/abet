class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|
    	t.references :measure
    	t.string "semester" # semester of the scores entered e.g. 2013FA
    	t.references :contact #person who provided the scores, not necessarily same as person who entered (e.g., a TA could have tabulated the scores and sent them to the AO who entered them)
    	t.integer "actual" # number between 0 and 100, percent of students who met the goal from the measure
      	t.timestamps
    end
    add_index("data_entries", "measure_id")
    add_index("data_entries", "contact_id")
  end
end
