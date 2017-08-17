class AddArchivedToIndirectAssessments < ActiveRecord::Migration[4.2]
  def change
    add_column :indirect_assessments, :archived, :boolean, default: false
    add_index :indirect_assessments, :archived
  end
end
