require "rails_helper"

describe Assignment do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:outcome_coverage) }
    it { should have_one(:outcome).through(:outcome_coverage) }
  end
end
