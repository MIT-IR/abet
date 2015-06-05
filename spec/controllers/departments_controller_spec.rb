require "rails_helper"

describe DepartmentsController do
  describe "#show" do
    it "renders a 401 if not authorized" do
      sign_in
      department = create(:department)

      get :show, id: department

      expect(response.status).to eq 401
    end
  end
end
