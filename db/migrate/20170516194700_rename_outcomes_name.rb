class RenameOutcomesName < ActiveRecord::Migration[5.0]
  def up
    drop_view :outcomes_with_metadata
    drop_view :assessment_reports

    rename_column :standard_outcomes, :name, :label
    rename_column :outcomes, :name, :label

    change_column :standard_outcomes, :label, :string, limit: 5
    change_column :outcomes, :label, :string, limit: 5

    execute "UPDATE outcomes SET label = UPPER(label)"
    execute "UPDATE standard_outcomes SET label = UPPER(label)"

    create_view :outcomes_with_metadata, version: 3
    create_view :assessment_reports, version: 3
  end

  def down
    drop_view :outcomes_with_metadata
    drop_view :assessment_reports

    rename_column :standard_outcomes, :label, :name
    rename_column :outcomes, :label, :name

    change_column :standard_outcomes, :label, :string, limit: nil
    change_column :outcomes, :label, :string, limit: nil

    execute "UPDATE outcomes SET label = LOWER(label)"
    execute "UPDATE standard_outcomes SET label = LOWER(label)"

    create_view :outcomes_with_metadata, version: 3
    create_view :assessment_reports, version: 2
  end
end
