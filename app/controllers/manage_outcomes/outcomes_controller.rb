class ManageOutcomes::OutcomesController < ApplicationController
  skip_after_action :verify_policy_scoped
  after_action :verify_authorized

  def index
    @course = course
    @unaligned_standard_outcomes = StandardOutcome.
      unaligned_with(course).
      order(:label)
    authorize(@course, :show?)
  end

  def new
    @outcome = course.outcomes.build
    authorize(@outcome)
    prepare_alignments(@outcome)
  end

  def create
    @outcome = course.outcomes.build(outcome_params)
    authorize(@outcome)

    if persist_outcome(@outcome)
      redirect_to manage_outcomes_course_outcomes_path(course), success: t(".success")
    else
      prepare_alignments(@outcome)
      render :new
    end
  end

  def edit
    @outcome = Outcome.includes(:standard_outcomes).find(params[:id])
    authorize(@outcome)
    prepare_alignments(@outcome)
  end

  def update
    @outcome = Outcome.find(params[:id])
    @outcome.assign_attributes(outcome_params)
    authorize(@outcome)

    if persist_outcome(@outcome)
      redirect_to manage_outcomes_course_outcomes_path(@outcome.course), success: t(".success")
    else
      prepare_alignments(@outcome)
      render :edit
    end
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end

  def prepare_alignments(outcome)
    StandardOutcome.all.each do |standard_outcome|
      unless outcome.standard_outcome_ids.include?(standard_outcome.id)
        @outcome.alignments.build(standard_outcome: standard_outcome)
      end
    end
  end

  def persist_outcome(outcome)
    if outcome.valid?
      ApplicationRecord.transaction do
        authorize(outcome)
        outcome.course.adopt_custom_outcomes!
        outcome.save!
      end
    end
  end

  def outcome_params
    params.require(:outcome).permit(
      :label,
      :description,
      :nickname,
      :standard_outcome_id,
      alignments_attributes: [
        :_destroy,
        :id,
        :standard_outcome_id,
        :level
      ]
    )
  end
end
