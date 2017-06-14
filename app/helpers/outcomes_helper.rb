module OutcomesHelper
  def outcome_card_class(outcome)
    if outcome.outcome_coverages.present?
      "outcome-card-matched"
    else
      "outcome-card-unmatched"
    end
  end
end
