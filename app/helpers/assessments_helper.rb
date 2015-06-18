module AssessmentsHelper
  def assessment_details(assessment)
    content_tag :ul, class: "assessment-details" do
      concat content_tag(:li, "Type: #{assessment.model_name.to_s}")

      if assessment.respond_to?(:subject)
        concat content_tag(:li, "Subject: #{assessment.subject}")
      end

      concat content_tag(:li, "Minimum: #{assessment.minimum_requirement}")
    end
  end
end
