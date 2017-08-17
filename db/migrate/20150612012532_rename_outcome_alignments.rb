class RenameOutcomeAlignments < ActiveRecord::Migration
  def change
    rename_table :outcome_alignments, :alignments
    rename_column :alignments, :alignment_level, :level
  end
end
