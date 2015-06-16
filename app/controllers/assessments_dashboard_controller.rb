class AssessmentsDashboardController < ApplicationController
  def show
    authorize(:generic, :create_assessments?)
  end
end
