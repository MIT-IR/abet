class RemoveResultAssessmentPolymorphism < ActiveRecord::Migration[5.0]
  def up
    remove_column :results, :assessment_type, :string, null: false
    add_index :results, [:assessment_id, :year, :semester], unique: true
    add_foreign_key :results, :direct_assessments, column: :assessment_id
  end

  def down
    remove_foreign_key :results, :direct_assessments
    add_column :results, :assessment_type, :string, null: false, default: "DirectAssessment"
    change_column_default :results, :assessment_type, nil
    remove_index :results, [:assessment_id, :year, :semester]
    add_index :results, [:assessment_id, :assessment_type, :year, :semester],
      name: "index_results_on_assessment_and_year_and_semester",
      unique: true
  end
end
