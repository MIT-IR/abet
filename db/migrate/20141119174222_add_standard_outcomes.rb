class AddStandardOutcomes < ActiveRecord::Migration[4.2]
  def change
    create_table "standard_outcomes" do |t|
      t.string :name
      t.string :description
    end
  end
end
