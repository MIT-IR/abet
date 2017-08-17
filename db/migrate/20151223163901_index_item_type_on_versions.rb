class IndexItemTypeOnVersions < ActiveRecord::Migration[5.1]
  def change
    add_index :versions, :item_type
  end
end
