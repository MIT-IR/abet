class RemoveStandardOutcomeIdFromOutcomes < ActiveRecord::Migration
  def change
    remove_column :outcomes, :standard_outcome_id, :integer
  end
end
