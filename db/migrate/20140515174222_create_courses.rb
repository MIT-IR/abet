class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string "name" # e.g. "Ocean Engineering"
    	t.string "number" # e.g. "2-OE"
    	t.references :contact 
    	t.boolean "abet_accredited", :default => true
      t.references :department
		t.timestamps
    end
    add_index("courses", "contact_id")
  end
end
