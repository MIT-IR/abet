class OutcomesController < ApplicationController
  def show
    @outcome = Outcome.find(params[:id])
    @direct_assessments = @outcome.direct_assessments
    @indirect_assessments = @outcome.indirect_assessments
  end

  def new
    @course = Course.find(params[:course_id])
    @defaults = StandardOutcome.retrieve_defaults || []
    @outcome = Outcome.new
    @defaults = StandardOutcome.all
    @align_levels = StandardOutcome.alignment_levels
  end

  def create
    @course = Course.find(params[:outcome][:course_id])
    @course.adopt_custom_outcomes!
    @outcome = @course.outcomes.build(outcome_params)
    if @outcome.save
      default_params = params["default"]
      default_params.each_key do |outcome_id|
        next if default_params[outcome_id] == StandardOutcome::NO_ALIGNMENT
        std = StandardOutcome.find(outcome_id)
        OutcomeAlignment.create!(
          :outcome => @outcome,
          :standard_outcome => std,
          :alignment_level => default_params[outcome_id])
      end
      redirect_to course_path(@course)
    end
  end

  private

  def outcome_params
    params.require(:outcome).permit(:name,:description)
  end

end
