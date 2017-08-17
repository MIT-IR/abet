class RemoveStandardOutcomeIdFromOutcomes < ActiveRecord::Migration[5.1]
  def change
    remove_column :outcomes, :standard_outcome_id, :integer
  end
end
