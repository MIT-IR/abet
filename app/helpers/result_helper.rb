module ResultHelper
  def result_assessment_path(result)
    if result.assessment_type == 'DirectAssessment'
      manage_results_direct_assessment_path(result.assessment_id)
    else
      manage_results_indirect_assessment_path(result.assessment_id)
    end
  end
end
