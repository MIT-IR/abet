SELECT
  outcomes.course_id,
  outcomes.label as outcome_label,
  outcomes.description as outcome_description,
  assessments.id as assessment_id,
  assessments.name as assessment_name,
  assessments.description as assessment_description,
  assessments.minimum_requirement,
  assessments.target_percentage,
  results.percentage as actual_percentage,
  results.year,
  results.semester,
  subjects.number as subject_number,
  subjects.title as subject_title
FROM results
  JOIN assessments on assessments.id = results.assessment_id
  JOIN subjects on subjects.id = assessments.subject_id
  JOIN outcome_assessments on outcome_assessments.assessment_id = assessments.id
  JOIN outcomes on outcomes.id = outcome_assessments.outcome_id
ORDER BY
  outcomes.label asc,
  results.year desc,
  results.semester desc
