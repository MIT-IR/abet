require "rails_helper"

describe Activity do
  describe "#date" do
    it "is the created_at timestamp as a date" do
      activity = Activity.new(created_at: Time.current)

      expect(activity.date).to eq Time.current.to_date
    end
  end
end
