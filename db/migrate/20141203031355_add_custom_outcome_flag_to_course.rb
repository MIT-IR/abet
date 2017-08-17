class AddCustomOutcomeFlagToCourse < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :has_custom_outcomes, :boolean
  end
end
