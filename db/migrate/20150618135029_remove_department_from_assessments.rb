class RemoveDepartmentFromAssessments < ActiveRecord::Migration[4.2]
  def change
    remove_reference :direct_assessments, :department
    remove_reference :indirect_assessments, :department
  end
end
