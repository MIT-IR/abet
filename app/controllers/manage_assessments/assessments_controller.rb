class ManageAssessments::AssessmentsController < ApplicationController
  around_action :authorize_assessment_management, only: [:create, :update]
  skip_after_action :verify_authorized, only: [:create, :update]

  def index
    @course = policy_scope(Course).find(params[:course_id])
    @outcomes = policy_scope(@course.outcomes).to_a
    @assessments = Assessment.
      for_course(@course).
      unarchived.
      includes(:subject, outcomes: :department)

    if filter_to_outcomes.present?
      @assessments = apply_outcome_filter_to(@assessments)
      @filtered_outcome = Outcome.find_by_id(params[:outcome_ids])
    end
  end

  def new
    @assessment = Assessment.new(subject_id: params[:subject_id])
    @courses = scoped_courses
    authorize(@assessment)
  end

  def create
    @assessment = Assessment.new(assessment_params)
    @courses = scoped_courses

    if @assessment.save
      flash[:html_safe] = true
      redirect_to(
        new_manage_assessments_assessment_path(subject_id: @assessment.subject_id),
        success: flash_after_create(@assessment)
      )
    else
      flash.now[:error] = @assessment.errors.full_messages.join("\n")
      render :new
    end
  end

  def edit
    @assessment = Assessment.find(params[:id])
    @courses = @assessment.department.courses.with_outcomes.includes(:outcomes)
    authorize(@assessment)
  end

  def update
    @assessment = Assessment.find(params[:id])
    @courses = @assessment.department.courses.with_outcomes

    if @assessment.update(assessment_params)
      redirect_to(
        manage_assessments_course_assessments_path(@assessment.courses.first),
        success: t(".success")
      )
    else
      flash.now[:error] = @assessment.errors.full_messages.join("\n")
      render :edit
    end
  end

  private

  def filter_to_outcomes
    params[:outcome_ids]
  end

  def apply_outcome_filter_to(scope)
    scope = scope.for_outcomes(filter_to_outcomes)
  end

  def authorize_assessment_management
    ActiveRecord::Base.transaction do
      yield
      return if !@assessment.errors.blank?
      unless AssessmentPolicy.new(current_user, @assessment).create?
        raise "Not authorized"
      end
    end
  end

  def assessment_params
    params.require(:assessment).permit(
      :description,
      :minimum_requirement,
      :name,
      :problem_description,
      :subject_id,
      :target_percentage,
      outcome_ids: []
    )
  end

  def scoped_courses
    policy_scope(Assessment).with_outcomes.includes(:outcomes)
  end

  def flash_after_create(assessment)
    links = assessment.courses.to_a.uniq.map do |course|
      view_context.link_to(
        view_context.sanitize(course.name),
        manage_assessments_course_assessments_path(course_id: course.id)
      )
    end

    t(".success", links: links.to_sentence(
      two_words_connector: " or ",
      last_word_connector: " or "
    ))
  end
end
