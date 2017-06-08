SELECT
  outcomes.course_id,
  outcomes.label as outcome_label,
  outcomes.description as outcome_description,
  outcomes.nickname as outcome_nickname,
  assignments.id as assignment_id,
  assignments.name as assignment_name,
  assignments.problem as assignment_problem,
  results.percentage as actual_percentage,
  results.year,
  results.semester,
  subjects.number as subject_number,
  subjects.title as subject_title
FROM results
  JOIN assignments on assignments.id = results.assignment_id
  JOIN outcome_coverages ON outcome_coverages.id = assignments.outcome_coverage_id
  JOIN coverages ON coverages.id = outcome_coverages.coverage_id
  JOIN subjects ON subjects.id = coverages.subject_id
  JOIN outcomes ON outcomes.id = outcome_coverages.outcome_id
ORDER BY
  outcomes.label asc,
  results.year desc,
  results.semester desc;
