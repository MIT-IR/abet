class AddIndexToArchivedOnDirectAssessments < ActiveRecord::Migration[5.1]
  def change
    add_index :direct_assessments, :archived
  end
end
