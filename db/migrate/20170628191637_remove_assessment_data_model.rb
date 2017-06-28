class RemoveAssessmentDataModel < ActiveRecord::Migration[5.1]
  def up
    drop_table :outcome_assessments

    change_table :results do |t|
      t.remove :assessment_id
      t.remove :assessment_name
      t.remove :assessment_description
      t.remove :problem_description
    end

    change_table :outcomes do |t|
      t.remove :assessments_count
    end

    drop_table :assessments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
