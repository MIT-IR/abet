class AddIdToOutcomeAlignments < ActiveRecord::Migration[5.1]
  def change
    add_column :outcome_alignments, :id, :primary_key
  end
end
