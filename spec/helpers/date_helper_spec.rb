require "rails_helper"

describe DateHelper do
  describe "#relative_date" do
    it "is 'Today' if supplied the current date" do
      expect(helper.relative_date(Date.today)).to eq "Today"
    end

    it "is 'Yesterday if supplied yesterday's date" do
      expect(helper.relative_date(Date.yesterday)).to eq "Yesterday"
    end

    it "is the exact date otherwise" do
      expect(helper.relative_date(DateTime.new(2000, 01, 01, 0, 0, 0))).to match(/01-01-2000/)
    end
  end
end
