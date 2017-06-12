class RemoveIndirectAssessments < ActiveRecord::Migration[5.0]
  def up
    drop_table :indirect_assessments

    execute "DELETE FROM outcome_assessments WHERE assessment_type = 'IndirectAssessment'"

    remove_column :outcome_assessments, :assessment_type
    add_index :outcome_assessments, :assessment_id
    add_foreign_key :outcome_assessments, :direct_assessments, column: :assessment_id
  end

  def down
    create_table "indirect_assessments", force: :cascade do |t|
      t.string   "name", null: false
      t.string   "description", null: false
      t.string   "survey_question"
      t.string   "minimum_requirement", null: false
      t.integer  "target_percentage", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "type", null: false
      t.boolean  "archived", default: false
      t.integer  "results_count", default: 0, null: false
      t.index ["archived"], name: "index_indirect_assessments_on_archived", using: :btree
    end

    remove_foreign_key :outcome_assessments, :direct_assessments
    remove_index :outcome_assessments, :assessment_id
    add_column :outcome_assessments, :assessment_type, :string, null: false, default: 'DirectAssessment'
    add_index :outcome_assessments, [:assessment_type, :assessment_id]
    change_column_default :outcome_assessments, :assessment_type, nil
  end
end
