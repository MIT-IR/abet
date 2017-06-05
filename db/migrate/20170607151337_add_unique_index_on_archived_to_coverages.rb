class AddUniqueIndexOnArchivedToCoverages < ActiveRecord::Migration[5.1]
  def change
    remove_index :coverages, [:course_id, :subject_id]
    add_index :coverages, [:course_id, :subject_id], unique: true, where: "(archived is FALSE)"
  end
end
