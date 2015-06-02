require "rails_helper"

describe HomeController do
  describe "#index" do
    it "renders a 401 if the user has access to no departments" do
      sign_in
      create(:department)
      allow(Permission).to receive(:for).and_return([])

      get :index

      expect(response.status).to eq 401
    end

    it "redirects to department if user has access to only one department" do
      sign_in
      department = create(:department)
      permission = Permission.new(department.role_department, "CAN EDIT ABET")
      allow(Permission).to receive(:for).and_return([permission])

      get :index

      expect(response).to redirect_to department_path(department)
    end
  end
end
