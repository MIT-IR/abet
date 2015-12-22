class ManageResults::SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject).
      with_direct_assessments.
      sorted_by_number
  end

  def show
    @subject = Subject.find(params[:id])
    authorize(@subject)
  end
end
