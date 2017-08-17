class AddSubjectToDirectAssessments < ActiveRecord::Migration[4.2]
  def change
    add_reference :direct_assessments, :subject, index: true, null: false
    add_foreign_key :direct_assessments, :subjects
  end
end
