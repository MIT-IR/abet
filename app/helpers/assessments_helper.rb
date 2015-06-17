module AssessmentsHelper
  def assessment_details(assessment)
    content_tag :ul, class: "assessment-details" do
      content_tag :li, "Type: #{assessment.model_name.to_s}"

      if assessment.respond_to?(:subject)
        content_tag :li, "Subject: #{assessment.subject}"
      end

      if assessment.minimum_requirement.present?
        content_tag :li, "Minimum: #{assessment.minimum_requirement}"
      end
    end
  end
end
