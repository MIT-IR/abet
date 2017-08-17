class AddTimestampsToTables < ActiveRecord::Migration[4.2]
  def change
    tables = %i(
      courses
      departments
      direct_assessments
      indirect_assessments
      outcome_alignments
      outcomes
      standard_outcomes
    )

    tables.each do |table|
      add_column table, :created_at, :datetime
      add_column table, :updated_at, :datetime

      reversible do |dir|
        dir.up do
          execute <<-SQL
            UPDATE #{table}
            SET created_at = now(), updated_at = now()
          SQL
        end
      end

      change_column_null table, :created_at, false
      change_column_null table, :updated_at, false
    end
  end
end
