class AddStandardOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table "standard_outcomes" do |t|
      t.string :name
      t.string :description
    end
  end
end
