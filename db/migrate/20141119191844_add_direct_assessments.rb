class AddDirectAssessments < ActiveRecord::Migration[4.2]
  def change
    create_table "direct_assessments" do |t|
      t.string :subject_number
      t.string :subject_description
      t.string :semester
      t.string :assignment_name
      t.string :assignment_description
      t.string :problem_description
      t.string :minimum_grade
      t.integer :target_percentage
      t.integer :actual_percentage
      t.integer :outcome_id
    end
  end
end
