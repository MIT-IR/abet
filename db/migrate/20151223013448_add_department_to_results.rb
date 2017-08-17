class AddDepartmentToResults < ActiveRecord::Migration[4.2]
  def change
    add_column :results, :department_id, :integer, index: true

    reversible do |dir|
      dir.up do
        populate_results_department_for_direct_assessments
        populate_results_department_for_indirect_assessments
      end
    end

    change_column_null :results, :department_id, :false
  end

  private

  def populate_results_department_for_direct_assessments
    execute <<-SQL
      UPDATE results SET department_id = results_with_department.department_id
      FROM (
        SELECT r.id as result_id, d.id as department_id
        FROM results r
        INNER JOIN direct_assessments da ON r.assessment_type = 'DirectAssessment' AND da.id = r.assessment_id
        INNER JOIN outcome_assessments oa ON oa.assessment_type = 'DirectAssessment' AND oa.assessment_id = da.id
        INNER JOIN outcomes o ON o.id = oa.outcome_id
        INNER JOIN courses c ON c.id = o.course_id
        INNER JOIN departments d ON d.id = c.department_id
      ) as results_with_department
      WHERE
         results_with_department.result_id = results.id
    SQL
  end

  def populate_results_department_for_indirect_assessments
    execute <<-SQL
      UPDATE results SET department_id = results_with_department.department_id
      FROM (
        SELECT r.id as result_id, d.id as department_id
        FROM results r
        INNER JOIN indirect_assessments ia ON r.assessment_type = 'IndirectAssessment' AND ia.id = r.assessment_id
        INNER JOIN outcome_assessments oa ON oa.assessment_type = 'IndirectAssessment' AND oa.assessment_id = ia.id
        INNER JOIN outcomes o ON o.id = oa.outcome_id
        INNER JOIN courses c ON c.id = o.course_id
        INNER JOIN departments d ON d.id = c.department_id
      ) as results_with_department
      WHERE
         results_with_department.result_id = results.id
    SQL
  end
end
