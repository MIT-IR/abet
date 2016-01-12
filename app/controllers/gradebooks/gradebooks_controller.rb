module Gradebooks
  class GradebooksController < ApplicationController
    before_action :ensure_required_params_present

    def show
      authorize(subject)
      @offering = Offering.new(
        subject: subject,
        semester: params[:semester],
        year: params[:year],
      )

      @offering.gradebook_id

      respond_to do |format|
        format.js { render :show }
      end
    rescue GradebookClient::Error
      render_gradebook_not_found
    end

    private

    def subject
      @_subject ||= Subject.find(params[:subject_id])
    end

    def ensure_required_params_present
      if params[:year].blank? || params[:semester].blank?
        render_gradebook_not_found
      end
    end

    def render_gradebook_not_found
      respond_to do |format|
        format.js { render :gradebook_not_found }
      end
    end
  end
end
