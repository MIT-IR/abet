class CreateSubjects < ActiveRecord::Migration[4.2]
  def change
    create_table :subjects do |t|
      t.string :number, unique: true, null: false
      t.string :title, null: false
    end
  end
end
