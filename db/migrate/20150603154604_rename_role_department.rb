class RenameRoleDepartment < ActiveRecord::Migration
  def change
    rename_column :departments, :role_department, :slug
    add_index :departments, :slug, unique: true
  end
end
