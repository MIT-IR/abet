class AddArchivedAssessmentsCountToOutcomes < ActiveRecord::Migration[4.2]
  def change
    add_column :outcomes, :archived_assessments_count, :integer, null: false, default: 0
  end
end
