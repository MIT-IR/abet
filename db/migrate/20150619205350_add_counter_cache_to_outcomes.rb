class AddCounterCacheToOutcomes < ActiveRecord::Migration[4.2]
  def change
    add_column :outcomes, :assessments_count, :integer, null: false, default: 0
  end
end
