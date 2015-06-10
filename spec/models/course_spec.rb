require "rails_helper"

describe Course do
  describe ".with_custom_outcomes" do
    it "finds courses that have custom outcomes" do
      course = create(:course, has_custom_outcomes: true)
      create(:course, has_custom_outcomes: false)

      expect(Course.with_custom_outcomes).to eq [course]
    end
  end
end
