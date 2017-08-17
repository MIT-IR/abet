class CreateOutcomeAssessments < ActiveRecord::Migration[4.2]
  def change
    create_table :outcome_assessments do |t|
      t.references :outcome, null: false, index: true
      t.references :assessment, polymorphic: true, null: false, index: true
      t.timestamps null: false
    end
  end
end
