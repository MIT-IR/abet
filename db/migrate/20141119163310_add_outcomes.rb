class AddOutcomes < ActiveRecord::Migration
  def change
    create_table "outcomes" do |t|
      t.string :name
      t.string :description
      t.integer :course_id
      t.integer :standard_outcome_id
    end
  end
end
