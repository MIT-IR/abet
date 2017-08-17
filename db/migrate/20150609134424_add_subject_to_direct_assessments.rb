class AddSubjectToDirectAssessments < ActiveRecord::Migration[5.1]
  def change
    add_reference :direct_assessments, :subject, index: true, null: false
    add_foreign_key :direct_assessments, :subjects
  end
end
