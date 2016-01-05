module Gradebooks
  class AssignmentsController < BaseController
    def index
      @offering = Offering.new(
        subject: subject,
        semester: params[:semester],
        year:  params[:year],
      )
    end

    private

    def subject
      @_subject ||= policy_scope(Subject).find(params[:subject_id])
    end
  end
end
