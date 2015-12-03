class ManageResults::DirectAssessmentsController < ApplicationController
  def show
    @assessment = DirectAssessment.
      includes(results: :assessment).
      includes(outcomes: :department).
      find(params[:id])
    authorize(@assessment)
  end
end
