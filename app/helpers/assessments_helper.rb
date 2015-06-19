module AssessmentsHelper
  def assessment_details(assessment)
    content_tag :ul, class: "assessment-details" do
      if assessment.respond_to?(:type)
        concat content_tag(:li, "Type: #{assessment_type(assessment)}")
      else
        concat content_tag(:li, "Type: #{assessment.model_name.human}")
      end

      if assessment.respond_to?(:subject)
        concat content_tag(:li, "Subject: #{assessment.subject}")
      end

      concat content_tag(:li, "Minimum: #{assessment.minimum_requirement}")
      concat content_tag(
        :li,
        "Target Percentage: #{assessment.target_percentage}%"
      )
    end
  end
end
