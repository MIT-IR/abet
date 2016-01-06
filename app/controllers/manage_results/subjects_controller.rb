class ManageResults::SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject).
      with_direct_assessments.
      sorted_by_number

    if @subjects.length == 1
      redirect_to manage_results_subject_path(@subjects.first.id)
    end
  end

  def show
    @subject = Subject.find(params[:id])
    authorize(@subject)
  end
end
