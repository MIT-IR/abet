class RemoveStandardOutcomeIdFromOutcomes < ActiveRecord::Migration[4.2]
  def change
    remove_column :outcomes, :standard_outcome_id, :integer
  end
end
