class AddResultsCountToAssessments < ActiveRecord::Migration[4.2]
  def change
    add_column :direct_assessments, :results_count, :integer, null: false, default: 0
    add_column :indirect_assessments, :results_count, :integer, null: false, default: 0

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE direct_assessments
          SET results_count = count
          FROM (
            SELECT assessment_type, assessment_id, count(*) as count
            FROM results
            GROUP BY assessment_type, assessment_id
          ) AS count_table
          WHERE
            assessment_type = 'DirectAssessment' AND
            assessment_id = direct_assessments.id
        SQL

        execute <<-SQL
          UPDATE indirect_assessments
          SET results_count = count
          FROM (
            SELECT assessment_type, assessment_id, count(*) as count
            FROM results
            GROUP BY assessment_type, assessment_id
          ) AS count_table
          WHERE
            assessment_type = 'IndirectAssessment' AND
            assessment_id = indirect_assessments.id
        SQL
      end
    end
  end
end
