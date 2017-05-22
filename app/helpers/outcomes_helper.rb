module OutcomesHelper
  def outcome_details(outcome)
    content_tag :ul, class: "assessment-details" do
      concat content_tag(:li, "Course: #{outcome.course}")
      concat content_tag(:li, "Outcome: #{outcome}")
    end
  end

  def outcome_card_class(outcome)
    if outcome.outcome_coverages.present?
      "outcome-card-matched"
    else
      "outcome-card-unmatched"
    end
  end
end
