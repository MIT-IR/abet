class AddUniqueIndexToCoverages < ActiveRecord::Migration[5.1]
  def change
    add_index :coverages, [:course_id, :subject_id], unique: true
    remove_index :coverages, [:course_id]
  end
end
