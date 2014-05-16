class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
    	t.string "name", :null => false # e.g. Mechanical Engineering
    	t.string "number", :null => false # e.g. 2
    	t.integer "sort_num", :null => false # should match 'number' but stored as int for sorting
        t.timestamps
    end
  end
end
