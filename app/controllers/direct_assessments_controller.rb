class DirectAssessmentsController < ApplicationController
  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = DirectAssessment.new
    @available_semesters = ['2015FA', '2015JA', '2015SP']
  end
  def create
    @outcome = Outcome.find(params[:outcome_id])
      @direct_assessment = @outcome.direct_assessments.build(direct_assessment_params)
    if @direct_assessment.save
      redirect_to outcome_path(@outcome)
    end
  end

  private

  def direct_assessment_params
    params.require(:direct_assessment).permit(:subject_number,
      :subject_description, :semester, :assignment_name,
      :assignment_description, :problem_description,
      :minimum_grade, :target_percentage, :actual_percentage)
  end
end

