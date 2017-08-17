class AddIndexToArchivedOnDirectAssessments < ActiveRecord::Migration[4.2]
  def change
    add_index :direct_assessments, :archived
  end
end
