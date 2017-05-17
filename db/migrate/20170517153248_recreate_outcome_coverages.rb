class RecreateOutcomeCoverages < ActiveRecord::Migration[5.0]
  def up
    create_table :outcome_coverages do |t|
      t.timestamps null: false
      t.references :coverage, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.references :outcome, null: false, index: true, foreign_key: true

      t.index [:coverage_id, :outcome_id], unique: true
    end

    execute <<-SQL
      INSERT INTO outcome_coverages (coverage_id, outcome_id, created_at, updated_at)
      SELECT id, outcome_id, now(), now() FROM coverages
    SQL

    remove_column :coverages, :outcome_id
  end

  def down
    add_reference :coverages, :outcome, index: true, foreign_key: true

    execute <<-SQL
      UPDATE coverages
      SET outcome_id = outcome_coverages.outcome_id
      FROM outcome_coverages
      WHERE outcome_coverages.coverage_id = coverages.id
    SQL

    change_column_null :coverages, :outcome_id, false
    drop_table :outcome_coverages
  end
end
