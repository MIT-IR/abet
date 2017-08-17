class AddDepartmentIdToAssessments < ActiveRecord::Migration[4.2]
  def change
    add_reference :direct_assessments, :department, null: false, index: true
    add_reference :indirect_assessments, :department, null: false, index: true
  end
end
