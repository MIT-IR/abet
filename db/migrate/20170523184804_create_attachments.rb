class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.attachment :file, null: false
      t.references :coverage, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
