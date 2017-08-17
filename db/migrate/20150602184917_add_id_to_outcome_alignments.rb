class AddIdToOutcomeAlignments < ActiveRecord::Migration
  def change
    add_column :outcome_alignments, :id, :primary_key
  end
end
