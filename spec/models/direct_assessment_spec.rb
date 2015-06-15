require "rails_helper"

describe DirectAssessment do
  describe "validations" do
    it { should validate_presence_of(:subject) }
  end
end
