class RenameOutcomeAlignments < ActiveRecord::Migration[5.1]
  def change
    rename_table :outcome_alignments, :alignments
    rename_column :alignments, :alignment_level, :level
  end
end
