class AddDepartmentIdToAssessments < ActiveRecord::Migration[5.1]
  def change
    add_reference :direct_assessments, :department, null: false, index: true
    add_reference :indirect_assessments, :department, null: false, index: true
  end
end
