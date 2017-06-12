class ChangePrimaryKeyType < ActiveRecord::Migration[5.1]
  def up
    drop_view :assignment_reports
    drop_view :outcomes_with_metadata

    change_column :alignments, :id, :bigint
    change_column :alignments, :outcome_id, :bigint
    change_column :alignments, :standard_outcome_id, :bigint
    change_column :assessments, :id, :bigint
    change_column :assessments, :subject_id, :bigint
    change_column :assignments, :id, :bigint
    change_column :assignments, :outcome_coverage_id, :bigint
    change_column :attachments, :id, :bigint
    change_column :attachments, :attachable_id, :bigint
    change_column :courses, :id, :bigint
    change_column :courses, :department_id, :bigint
    change_column :coverages, :id, :bigint
    change_column :coverages, :course_id, :bigint
    change_column :coverages, :subject_id, :bigint
    change_column :coverages, :subject_id, :bigint
    change_column :departments, :id, :bigint
    change_column :outcome_assessments, :id, :bigint
    change_column :outcome_assessments, :assessment_id, :bigint
    change_column :outcome_assessments, :outcome_id, :bigint
    change_column :outcome_coverages, :id, :bigint
    change_column :outcome_coverages, :coverage_id, :bigint
    change_column :outcome_coverages, :outcome_id, :bigint
    change_column :outcomes, :id, :bigint
    change_column :outcomes, :course_id, :bigint
    change_column :results, :id, :bigint
    change_column :results, :assessment_id, :bigint
    change_column :results, :department_id, :bigint
    change_column :standard_outcomes, :id, :bigint
    change_column :subjects, :id, :bigint
    change_column :users, :id, :bigint
    change_column :versions, :id, :bigint
    change_column :versions, :item_id, :bigint

    create_view :assignment_reports, version: 1
    create_view :outcomes_with_metadata, version: 3
  end

  def down
    drop_view :assignment_reports
    drop_view :outcomes_with_metadata

    change_column :alignments, :id, :int
    change_column :alignments, :outcome_id, :int
    change_column :alignments, :standard_outcome_id, :int
    change_column :assessments, :id, :int
    change_column :assessments, :subject_id, :int
    change_column :assignments, :id, :int
    change_column :assignments, :outcome_coverage_id, :int
    change_column :attachments, :id, :int
    change_column :attachments, :attachable_id, :int
    change_column :courses, :id, :int
    change_column :courses, :department_id, :int
    change_column :coverages, :id, :int
    change_column :coverages, :course_id, :int
    change_column :coverages, :subject_id, :int
    change_column :coverages, :subject_id, :int
    change_column :departments, :id, :int
    change_column :outcome_assessments, :id, :int
    change_column :outcome_assessments, :assessment_id, :int
    change_column :outcome_assessments, :outcome_id, :int
    change_column :outcome_coverages, :id, :int
    change_column :outcome_coverages, :coverage_id, :int
    change_column :outcome_coverages, :outcome_id, :int
    change_column :outcomes, :id, :int
    change_column :outcomes, :course_id, :int
    change_column :results, :id, :int
    change_column :results, :assessment_id, :int
    change_column :results, :department_id, :int
    change_column :standard_outcomes, :id, :int
    change_column :subjects, :id, :int
    change_column :users, :id, :int
    change_column :versions, :id, :int
    change_column :versions, :item_id, :int

    create_view :assignment_reports, version: 1
    create_view :outcomes_with_metadata, version: 3
  end
end
