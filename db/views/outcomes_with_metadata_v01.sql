SELECT
  outcomes.*,
  coalesce(active_direct_assessments.count, 0) as active_direct_assessments_count,
  coalesce(active_indirect_assessments.count, 0) as active_indirect_assessments_count,
  coalesce(active_direct_assessments_with_results.count, 0) as active_direct_assessments_with_results_count,
  coalesce(active_indirect_assessments_with_results.count, 0) as active_indirect_assessments_with_results_count
FROM
  outcomes
  LEFT JOIN (
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN direct_assessments ON direct_assessments.id = outcome_assessments.assessment_id
    WHERE outcome_assessments.assessment_type = 'DirectAssessment' AND direct_assessments.archived = false
    GROUP BY outcome_assessments.outcome_id
  ) as active_direct_assessments ON outcomes.id  = active_direct_assessments.outcome_id
  LEFT JOIN(
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN indirect_assessments ON indirect_assessments.id = outcome_assessments.assessment_id
    WHERE outcome_assessments.assessment_type = 'IndirectAssessment' AND indirect_assessments.archived = false
    GROUP BY outcome_assessments.outcome_id
  ) as active_indirect_assessments ON outcomes.id  = active_indirect_assessments.outcome_id
  LEFT JOIN(
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN direct_assessments ON direct_assessments.id = outcome_assessments.assessment_id
    WHERE outcome_assessments.assessment_type = 'DirectAssessment' AND direct_assessments.archived = false AND direct_assessments.results_count > 0
    GROUP BY outcome_assessments.outcome_id
  ) as active_direct_assessments_with_results ON outcomes.id = active_direct_assessments_with_results.outcome_id
  LEFT JOIN(
    SELECT outcome_assessments.outcome_id, count(*) as count
    FROM outcome_assessments
    INNER JOIN indirect_assessments ON indirect_assessments.id = outcome_assessments.assessment_id
    WHERE outcome_assessments.assessment_type = 'IndirectAssessment' AND indirect_assessments.archived = false AND indirect_assessments.results_count > 0
    GROUP BY outcome_assessments.outcome_id
  ) as active_indirect_assessments_with_results ON outcomes.id = active_indirect_assessments_with_results.outcome_id
