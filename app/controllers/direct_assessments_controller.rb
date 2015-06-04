class DirectAssessmentsController < ApplicationController
  include AssessmentAuthorization

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.direct_assessments.build
    @available_semesters = ['2015FA', '2015JA', '2015SP']
    authorize(@assessment)
  end

  def create
    @outcome = Outcome.find(params[:outcome_id])
    @direct_assessment = @outcome.direct_assessments.build(direct_assessment_params)
    authorize(@direct_assessment)

    if @direct_assessment.save
      redirect_to outcome_path(@outcome)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = DirectAssessment.find(params[:id])
    @available_semesters = ['2015FA', '2015JA', '2015SP']
    authorize(@assessment)
  end

  def update
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)

    @assessment.assign_attributes(direct_assessment_params)
    if @assessment.save
      redirect_to outcome_path(@outcome)
    else
      render :edit
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
