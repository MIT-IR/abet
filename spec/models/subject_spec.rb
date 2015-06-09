require "rails_helper"

describe Subject do
  describe "#to_s" do
    it "combines number and title" do
      the_subject = Subject.new(number: 1.234, title: "Test")

      expect(the_subject.to_s).to eq "1.234 - Test"
    end
  end
end
