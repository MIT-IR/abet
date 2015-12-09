class AddArchivedAssessmentsCountToOutcomes < ActiveRecord::Migration
  def change
    add_column :outcomes, :archived_assessments_count, :integer, null: false, default: 0
  end
end
