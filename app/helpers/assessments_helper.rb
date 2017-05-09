module AssessmentsHelper
  def assessment_details(assessment)
    content_tag :ul, class: "assessment-details" do
      concat content_tag(:li, "Type: #{assessment.model_name.human}")
      concat content_tag(:li, "Subject: #{assessment.subject}")
      concat content_tag(:li, "Minimum: #{assessment.minimum_requirement}")
      concat content_tag(
        :li,
        "Target Percentage: #{assessment.target_percentage}%"
      )
    end
  end
end
