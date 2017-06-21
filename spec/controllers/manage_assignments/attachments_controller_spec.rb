require "rails_helper"

describe ManageAssignments::AttachmentsController do
  describe "GET #show" do
    it "downloads the requested attachment from server" do
      assignment = create(:assignment)
      attachment = create(:attachment, attachable: assignment)
      department = assignment.course_department
      user = user_with_assignments_access_to(department)

      sign_in(user)
      get :show, params: { id: attachment.id }

      expect(response).to redirect_to(attachment.expiring_url)
    end
  end
end
