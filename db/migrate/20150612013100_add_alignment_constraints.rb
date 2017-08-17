class AddAlignmentConstraints < ActiveRecord::Migration[4.2]
  def change
    change_column_null :alignments, :outcome_id, false
    change_column_null :alignments, :standard_outcome_id, false
    change_column_null :alignments, :level, false

    add_foreign_key :alignments, :outcomes
    add_foreign_key :alignments, :standard_outcomes

    add_index :alignments, [:outcome_id, :standard_outcome_id], unique: true
    #add_index :alignments, :standard_outcome_id
  end
end
