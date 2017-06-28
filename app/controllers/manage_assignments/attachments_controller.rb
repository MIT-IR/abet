module ManageAssignments
  class AttachmentsController < ApplicationController
    def show
      @attachment = Attachment.find(params[:id])
      authorize(@attachment)

      redirect_to @attachment.expiring_url
    end

    def destroy
      attachment = Attachment.find(params[:id])
      authorize(attachment)

      attachment.destroy!

      redirect_to manage_assignments_course_path(attachment.attachable.course)
    end
  end
end
