class AddIndirectAssessments < ActiveRecord::Migration[4.2]
  def change
    create_table "indirect_assessments" do |t|
      t.string :assessment_name
      t.string :assessment_description
      t.string :survey_question
      t.integer :year
      t.string :minimum_category
      t.integer :target_percentage
      t.integer :actual_percentage
      t.integer :outcome_id
    end
  end
end
