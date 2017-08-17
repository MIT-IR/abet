class AddCounterCacheToOutcomes < ActiveRecord::Migration
  def change
    add_column :outcomes, :assessments_count, :integer, null: false, default: 0
  end
end
