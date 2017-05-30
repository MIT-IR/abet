class AddAttachableToAttachments < ActiveRecord::Migration[5.1]
  def change
    change_table :attachments do |t|
      t.integer :attachable_id, null: false
      t.string :attachable_type, null: false
      t.index [:attachable_type, :attachable_id]
    end

    remove_reference :attachments, :coverage
  end
end
