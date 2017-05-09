require "rails_helper"

describe Outcome do
  context "counter cache" do
    it "counts the number of assessments" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment)

      expect(outcome.assessments_count).to eq 1
    end

    it "decreases when assessments are removed" do
      outcome = create(:outcome)
      direct_assessment = create(:direct_assessment)
      outcome.direct_assessments << direct_assessment
      direct_assessment.destroy

      expect(outcome.reload.assessments_count).to eq 0
    end
  end
end
