class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
    	t.string "assess_type" # e.g. direct or indirect
    	t.references :outcome
      	t.timestamps
    end
    add_index("assessments","outcome_id")
  end
end
