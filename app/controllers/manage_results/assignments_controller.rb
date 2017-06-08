module ManageResults
  class AssignmentsController < ApplicationController
    def show
      @assignment = Assignment.find(params[:id])
      authorize(@assignment)
    end
  end
end
