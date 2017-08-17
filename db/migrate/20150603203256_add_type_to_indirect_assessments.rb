class AddTypeToIndirectAssessments < ActiveRecord::Migration
  def change
    add_column :indirect_assessments, :type, :string, null: false
  end
end
