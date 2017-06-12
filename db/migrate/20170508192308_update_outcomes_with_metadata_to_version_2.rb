class UpdateOutcomesWithMetadataToVersion2 < ActiveRecord::Migration[5.0]
  def change
    update_view :outcomes_with_metadata, version: 2, revert_to_version: 1
  end
end
