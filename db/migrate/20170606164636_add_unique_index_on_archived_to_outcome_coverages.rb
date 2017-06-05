class AddUniqueIndexOnArchivedToOutcomeCoverages < ActiveRecord::Migration[5.1]
  def change
    remove_index :outcome_coverages, [:coverage_id, :outcome_id]
    add_index :outcome_coverages, [:coverage_id, :outcome_id], unique: true, where: "(archived is FALSE)"
  end
end
