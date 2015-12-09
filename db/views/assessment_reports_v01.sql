SELECT
  outcomes.course_id,
  outcomes.name as outcome_name,
  outcomes.description as outcome_description,
  direct_assessments.id as direct_assessment_id,
  direct_assessments.name as direct_assessment_name,
  direct_assessments.description as direct_assessment_description,
  direct_assessments.minimum_requirement,
  direct_assessments.target_percentage,
  results.percentage as actual_percentage,
  results.year,
  results.semester,
  subjects.number as subject_number,
  subjects.title as subject_title
FROM results
  JOIN direct_assessments on direct_assessments.id = results.assessment_id
  JOIN subjects on subjects.id = direct_assessments.subject_id
  JOIN outcome_assessments on outcome_assessments.assessment_id = direct_assessments.id
  JOIN outcomes on outcomes.id = outcome_assessments.outcome_id
ORDER BY
  outcomes.name asc,
  results.year desc,
  results.semester desc
