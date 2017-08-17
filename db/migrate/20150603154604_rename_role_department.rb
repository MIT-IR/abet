class RenameRoleDepartment < ActiveRecord::Migration[4.2]
  def change
    rename_column :departments, :role_department, :slug
    add_index :departments, :slug, unique: true
  end
end
