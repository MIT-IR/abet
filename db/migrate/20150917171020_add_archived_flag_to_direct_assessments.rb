class AddArchivedFlagToDirectAssessments < ActiveRecord::Migration[4.2]
  def change
    add_column :direct_assessments, :archived, :boolean, :default => false
  end
end
