class CreateResults < ActiveRecord::Migration[4.2]
  def change
    create_table :results do |t|
      t.integer :assessment_id, null: false
      t.string :assessment_type, null: false
      t.string :assessment_name, null: false
      t.string :assessment_description, null: false
      t.string :problem_description
      t.integer :percentage, null: false
      t.integer :year, null: false
      t.string :semester
      t.timestamps null: false
    end

    add_index :results,
      [:assessment_id, :assessment_type, :year, :semester],
      unique: true,
      name: "index_results_on_assessment_and_year_and_semester"
  end
end
