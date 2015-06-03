require "rails_helper"

describe DepartmentsController do
  describe "#show" do
    it "raises an error if not authorized" do
      sign_in
      department = create(:department)

      expect { get :show, id: department }.
        to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
