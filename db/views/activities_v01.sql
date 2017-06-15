SELECT
  versions.id as id,
  versions.item_type as item_type,
  versions.item_id as item_id,
  versions.event as event,
  versions.whodunnit as user_id,
  departments.id as department_id,
  versions.created_at as created_at
FROM versions
INNER JOIN results on versions.item_id = results.id
INNER JOIN departments on results.department_id = departments.id
WHERE item_type = 'Result'

UNION ALL

SELECT
  versions.id as id,
  versions.item_type as item_type,
  versions.item_id as item_id,
  versions.event as event,
  versions.whodunnit as user_id,
  departments.id as department_id,
  versions.created_at as created_at
FROM versions
INNER JOIN assignments on versions.item_id = assignments.id
INNER JOIN outcome_coverages on assignments.outcome_coverage_id = outcome_coverages.id
INNER JOIN coverages on outcome_coverages.coverage_id = coverages.id
INNER JOIN courses on coverages.course_id = courses.id
INNER JOIN departments on courses.department_id = departments.id
WHERE item_type = 'Assignment'

UNION ALL

SELECT
  versions.id as id,
  versions.item_type as item_type,
  versions.item_id as item_id,
  versions.event as event,
  versions.whodunnit as user_id,
  departments.id as department_id,
  versions.created_at as created_at
FROM versions
INNER JOIN outcome_coverages on versions.item_id = outcome_coverages.id
INNER JOIN coverages on outcome_coverages.coverage_id = coverages.id
INNER JOIN courses on coverages.course_id = courses.id
INNER JOIN departments on courses.department_id = departments.id
WHERE item_type = 'OutcomeCoverage';
