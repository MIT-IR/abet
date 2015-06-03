require "rails_helper"

describe HomeController do
  describe "#index" do
    it "renders a 401 if the user has access to no departments" do
      user = sign_in
      grant_access(user, [], "")
      create(:department)

      get :index

      expect(response.status).to eq 401
    end

    it "redirects to department if user has access to only one department" do
      user = sign_in
      department = create(:department)
      grant_access(user, department, Permission::ADMIN)

      get :index

      expect(response).to redirect_to department_path(department)
    end
  end
end
