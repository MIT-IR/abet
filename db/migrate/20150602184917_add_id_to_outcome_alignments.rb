class AddIdToOutcomeAlignments < ActiveRecord::Migration[4.2]
  def change
    add_column :outcome_alignments, :id, :primary_key
  end
end
