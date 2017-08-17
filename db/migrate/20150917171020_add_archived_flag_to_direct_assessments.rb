class AddArchivedFlagToDirectAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :direct_assessments, :archived, :boolean, :default => false
  end
end
