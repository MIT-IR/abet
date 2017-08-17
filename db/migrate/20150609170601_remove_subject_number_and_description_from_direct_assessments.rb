class RemoveSubjectNumberAndDescriptionFromDirectAssessments < ActiveRecord::Migration[5.1]
  def change
    remove_column :direct_assessments, :subject_number, :string
    remove_column :direct_assessments, :subject_description, :string
  end
end
