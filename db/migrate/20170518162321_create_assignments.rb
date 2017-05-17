class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.timestamps null: false
      t.references :outcome_coverage, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.string :problem, null: false
    end
  end
end
