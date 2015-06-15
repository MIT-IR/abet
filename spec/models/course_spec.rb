require "rails_helper"

describe Course do
  describe ".with_outcomes" do
    it "finds courses that have outcomes" do
      course = create(:outcome).course
      create(:course)

      expect(Course.with_outcomes).to eq [course]
    end
  end

  describe ".without_outcomes" do
    it "finds courses that do not have outcomes" do
      course = create(:course)
      create(:outcome)

      expect(Course.without_outcomes).to eq [course]
    end
  end
end
