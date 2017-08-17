class RemoveOutcomeIdFromAssessments < ActiveRecord::Migration[5.1]
  def change
    remove_column :direct_assessments, :outcome_id, :integer
    remove_column :indirect_assessments, :outcome_id, :integer
  end
end
