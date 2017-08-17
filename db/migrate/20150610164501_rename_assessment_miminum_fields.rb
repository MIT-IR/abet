class RenameAssessmentMiminumFields < ActiveRecord::Migration
  def change
    rename_column :direct_assessments, :minimum_grade, :minimum_requirement
    rename_column :indirect_assessments, :minimum_category, :minimum_requirement
  end
end
