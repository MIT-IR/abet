class IndirectAssessmentsController < ApplicationController
  def show
    @assessment = IndirectAssessment.find(params[:id])
    authorize(@assessment)
  end
end
