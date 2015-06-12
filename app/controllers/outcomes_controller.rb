class OutcomesController < ApplicationController
  def show
    @outcome = Outcome.find(params[:id])
    @direct_assessments = @outcome.direct_assessments
    @indirect_assessments = @outcome.indirect_assessments
    authorize(@outcome)
  end

  def new
    @outcome = course.outcomes.build

    StandardOutcome.all.each do |default_outcome|
      @outcome.alignments.build(standard_outcome: default_outcome)
    end

    authorize(@outcome)
  end

  def create
    @outcome = course.outcomes.build(outcome_params)

    if create_outcome(@outcome)
      redirect_to course_path(course), success: t(".success")
    else
      render :new
    end
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end

  def create_outcome(outcome)
    ActiveRecord::Base.transaction do
      authorize(outcome)
      outcome.course.adopt_custom_outcomes!
      outcome.save!
    end
  end

  def outcome_params
    params.require(:outcome).permit(
      :name,
      :description,
      alignments_attributes: [
        :standard_outcome_id,
        :level
      ]
    )
  end
end
