class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string "krbname", :null => false
    	t.string "email", :null => false
    	t.string "first_name"
    	t.string "last_name"
    	t.string "phone_number"
    	t.string "position" # e.g. "Undergraduate Officer", "Department Head"
    	t.references :department
      t.timestamps
    end
    add_index("contacts", "department_id")
  end
end
