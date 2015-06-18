class DirectAssessmentsController < ApplicationController
  def new
    @assessment = DirectAssessment.new
    @courses = scoped_courses
    authorize(@assessment)
  end

  def create
    @assessment = DirectAssessment.new(direct_assessment_params)
    @courses = scoped_courses
    authorize(@assessment)

    if @assessment.save
      redirect_to direct_assessment_path(@assessment.id), success: t(".success")
    else
      flash.now[:error] = @assessment.errors.full_messages.join("\n")
      render :new
    end
  end

  def edit
    @assessment = DirectAssessment.find(params[:id])
    @courses = @assessment.department.courses.with_outcomes
    authorize(@assessment)
  end

  def update
    @assessment = DirectAssessment.find(params[:id])
    @courses = @assessment.department.courses.with_outcomes
    authorize(@assessment)

    if @assessment.update(direct_assessment_params)
      redirect_to direct_assessment_path(@assessment.id), success: t(".success")
    else
      flash.now[:error] = @assessment.errors.full_messages.join("\n")
      render :edit
    end
  end

  def show
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  private

  def direct_assessment_params
    params.require(:direct_assessment).permit(
      :actual_percentage,
      :description,
      :minimum_requirement,
      :name,
      :problem_description,
      :semester,
      :subject_id,
      :target_percentage,
      outcome_ids: []
    )
  end

  def scoped_courses
    policy_scope(DirectAssessment).with_outcomes.includes(:outcomes)
  end
end
