class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :number, unique: true, null: false
      t.string :title, null: false
    end
  end
end
