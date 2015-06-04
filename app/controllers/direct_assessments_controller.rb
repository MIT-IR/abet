class DirectAssessmentsController < ApplicationController
  include AssessmentAuthorization

  def new
    @outcome = Outcome.find(params[:outcome_id])
    @assessment = @outcome.direct_assessments.build(new_assessment_attributes)
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

  def new_assessment_attributes
    if params[:assessment_id]
      cloned_assessment = DirectAssessment.find(params[:assessment_id])
      cloned_assessment.attributes.except!(*non_cloned_attributes)
    else
      {}
    end
  end

  def non_cloned_attributes
    ["id", "created_at", "updated_at", "actual_percentage"]
  end

  def direct_assessment_params
    params.require(:direct_assessment).permit(:subject_number,
      :subject_description, :semester, :assignment_name,
      :assignment_description, :problem_description,
      :minimum_grade, :target_percentage, :actual_percentage)
  end
end
