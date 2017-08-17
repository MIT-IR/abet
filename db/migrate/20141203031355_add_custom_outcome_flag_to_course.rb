class AddCustomOutcomeFlagToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :has_custom_outcomes, :boolean
  end
end
