class IndexItemTypeOnVersions < ActiveRecord::Migration
  def change
    add_index :versions, :item_type
  end
end
