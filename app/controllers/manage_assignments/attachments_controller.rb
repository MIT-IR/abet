module ManageAssignments
  class AttachmentsController < ApplicationController
    def show
      @attachment = Attachment.find(params[:id])
      authorize(@attachment)

      redirect_to @attachment.expiring_url
    end
  end
end
