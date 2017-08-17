class AddTypeToIndirectAssessments < ActiveRecord::Migration[4.2]
  def change
    add_column :indirect_assessments, :type, :string, null: false
  end
end
