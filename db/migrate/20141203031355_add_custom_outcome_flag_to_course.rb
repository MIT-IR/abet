class AddCustomOutcomeFlagToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :has_custom_outcomes, :boolean
  end
end
