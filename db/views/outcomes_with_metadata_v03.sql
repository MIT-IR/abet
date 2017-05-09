SELECT
  outcomes.*,
  coalesce(active_assessments.count, 0) as active_assessments_count,
  coalesce(active_assessments_with_results.count, 0) as active_assessments_with_results_count
FROM
  outcomes
  LEFT JOIN (
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN assessments ON assessments.id = outcome_assessments.assessment_id
    WHERE assessments.archived = false
    GROUP BY outcome_assessments.outcome_id
  ) as active_assessments ON outcomes.id  = active_assessments.outcome_id
  LEFT JOIN(
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN assessments ON assessments.id = outcome_assessments.assessment_id
    WHERE assessments.archived = false AND assessments.results_count > 0
    GROUP BY outcome_assessments.outcome_id
  ) as active_assessments_with_results ON outcomes.id = active_assessments_with_results.outcome_id
