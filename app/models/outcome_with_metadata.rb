class OutcomeWithMetadata < Outcome
  self.table_name = "outcomes_with_metadata"

  def active_assessments_count
    active_direct_assessments_count + active_indirect_assessments_count
  end

  def active_assessments_with_results_count
    active_direct_assessments_with_results_count +
      active_indirect_assessments_with_results_count
  end
end
