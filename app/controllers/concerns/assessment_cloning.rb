module AssessmentCloning
  extend ActiveSupport::Concern

  def new_assessment_attributes
    if params[:assessment_id]
      cloned_assessment = IndirectAssessment.find(params[:assessment_id])
      cloned_assessment.attributes.except!(*non_cloned_attributes)
    else
      {}
    end
  end

  def non_cloned_attributes
    ["id", "created_at", "updated_at", "actual_percentage"]
  end
end
