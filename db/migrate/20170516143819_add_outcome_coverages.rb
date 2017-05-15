class AddOutcomeCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :outcome_coverages do |t|
      t.timestamps null: false
      t.references :course, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :outcome, index: true, foreign_key: true
    end
  end
end
