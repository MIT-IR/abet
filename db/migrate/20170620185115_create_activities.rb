class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_view :activities
  end
end
