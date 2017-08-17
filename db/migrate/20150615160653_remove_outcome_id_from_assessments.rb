class RemoveOutcomeIdFromAssessments < ActiveRecord::Migration
  def change
    remove_column :direct_assessments, :outcome_id, :integer
    remove_column :indirect_assessments, :outcome_id, :integer
  end
end
