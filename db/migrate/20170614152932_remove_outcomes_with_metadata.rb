class RemoveOutcomesWithMetadata < ActiveRecord::Migration[5.1]
  def change
    drop_view :outcomes_with_metadata
  end
end
