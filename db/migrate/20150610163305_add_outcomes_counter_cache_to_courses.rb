class AddOutcomesCounterCacheToCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :outcomes_count, :integer, null: false, default: 0
  end
end
