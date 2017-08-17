class IndexItemTypeOnVersions < ActiveRecord::Migration[4.2]
  def change
    add_index :versions, :item_type
  end
end
