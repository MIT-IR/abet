module OutcomesHelper
  def assessment_type(assessment)
    if assessment.type == "OtherAssessment"
      "Other"
    elsif assessment.type == "Participation"
      "Program Participation"
    else
      assessment.type
    end
  end

  def outcome_details(outcome)
    content_tag :ul, class: "assessment-details" do
      concat content_tag(:li, "Course: #{outcome.course}")
      concat content_tag(:li, "Outcome: #{outcome}")
    end
  end
end
