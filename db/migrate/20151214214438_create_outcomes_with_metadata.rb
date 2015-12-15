class CreateOutcomesWithMetadata < ActiveRecord::Migration
  def change
    remove_column :outcomes,
      :archived_assessments_count,
      :integer,
      null: false,
      default: 0

    create_view :outcomes_with_metadata
  end
end
