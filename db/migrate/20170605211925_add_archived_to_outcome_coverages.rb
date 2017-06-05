class AddArchivedToOutcomeCoverages < ActiveRecord::Migration[5.1]
  def change
    add_column :outcome_coverages, :archived, :boolean, default: false, null: false
  end
end
