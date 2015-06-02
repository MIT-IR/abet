require "spec_helper"

describe Permission do
  describe ".for" do
    it "creates permission objects from the roles db" do
      username = "dprior"
      accounts = [
        fake_account("D_TEST1", "CAN EDIT ABET"),
        fake_account("D_TEST2", "CAN VIEW ABET")
      ]
      allow(RolesDb.client).to receive(:accounts_for).
        with(username).
        and_return(accounts)

      permissions = Permission.for(username)

      expect(permissions.size).to eq accounts.size
      expect(permissions.first.department_slug).to eq "D_TEST1"
      expect(permissions.first.access_level).to eq "CAN EDIT ABET"
      expect(permissions.last.department_slug).to eq "D_TEST2"
      expect(permissions.last.access_level).to eq "CAN VIEW ABET"
    end
  end

  def fake_account(department_slug, access_level)
    double(
      "Account",
      account_has_access_to: department_slug,
      function: access_level
    )
  end
end
