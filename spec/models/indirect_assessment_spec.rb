require "rails_helper"

describe IndirectAssessment do
  describe "#department" do
    it "should return the department of the first associated outcome" do
      assessment = create(:survey)
      outcome = assessment.outcomes.first

      expect(assessment.department).to eq outcome.department
    end
  end
end
