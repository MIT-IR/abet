class AddDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table "departments" do |t|
      t.string "name"
      t.string "role_department"
    end
  end
end
