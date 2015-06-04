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
end
