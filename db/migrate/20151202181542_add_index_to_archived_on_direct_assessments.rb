class AddIndexToArchivedOnDirectAssessments < ActiveRecord::Migration
  def change
    add_index :direct_assessments, :archived
  end
end
