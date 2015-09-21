class ManageResults::SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject).sorted_by_number
  end

  def show
    @subject = Subject.find(params[:id])
    authorize(@subject)
    @assessments = @subject.direct_assessments.sorted_by_name
  end
end
