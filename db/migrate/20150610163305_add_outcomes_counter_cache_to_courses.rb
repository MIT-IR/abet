class AddOutcomesCounterCacheToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :outcomes_count, :integer, null: false, default: 0
  end
end
