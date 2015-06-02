require 'spec_helper'

describe User do
  describe "#username" do
    it "is extracted from the user's email address" do
      user = User.new(email: "dprior@mit.edu")

      expect(user.username).to eq "dprior"
    end
  end
end
