class ManageResults::SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject).
      with_assignments.
      sorted_by_number

    if @subjects.length == 1
      redirect_to manage_results_subject_path(@subjects.first)
    end
  end

  def show
    @subject = Subject.find(params[:id])
    authorize(@subject)
  end
end
