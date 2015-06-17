class RemoveDepartmentFromAssessments < ActiveRecord::Migration
  def change
    remove_reference :direct_assessments, :department
    remove_reference :indirect_assessments, :department
  end
end
