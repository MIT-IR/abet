class RemovePercentageYearSemesterFromAssessments < ActiveRecord::Migration[5.1]
  def change
    remove_column :direct_assessments, :actual_percentage, :integer
    remove_column :direct_assessments, :semester, :string

    remove_column :indirect_assessments, :actual_percentage, :integer
    remove_column :indirect_assessments, :year, :integer
  end
end
