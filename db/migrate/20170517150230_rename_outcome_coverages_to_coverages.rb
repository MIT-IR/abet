class RenameOutcomeCoveragesToCoverages < ActiveRecord::Migration[5.0]
  def change
    rename_table :outcome_coverages, :coverages
  end
end
