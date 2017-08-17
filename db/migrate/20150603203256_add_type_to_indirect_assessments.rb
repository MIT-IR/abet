class AddTypeToIndirectAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :indirect_assessments, :type, :string, null: false
  end
end
