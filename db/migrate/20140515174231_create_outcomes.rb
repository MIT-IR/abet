class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
    	t.string "outcome" # e.g. "a." for ABET or "2.5" for departmental ones
    	t.text "description" # the text of the outcome
    	t.references :course
    	t.string "commission", :default => "EAC" # EAC or CAC
      	t.timestamps
    end
    add_index("outcomes","course_id")
  end
end
