class AddStandardOutcomes < ActiveRecord::Migration
  def change
    create_table "standard_outcomes" do |t|
      t.string :name
      t.string :description
    end
  end
end
