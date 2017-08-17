class AddArchivedFlagToDirectAssessments < ActiveRecord::Migration
  def change
    add_column :direct_assessments, :archived, :boolean, :default => false
  end
end
