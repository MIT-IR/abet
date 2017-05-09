require "rails_helper"

describe Outcome do
  context "assessments counter cache" do
    it "counts the number of assessments" do
      outcome = create(:outcome)
      outcome.assessments << create(:assessment)

      expect(outcome.assessments_count).to eq 1
    end

    it "decreases when assessments are removed" do
      outcome = create(:outcome)
      assessment = create(:assessment)
      outcome.assessments << assessment
      assessment.destroy

      expect(outcome.reload.assessments_count).to eq 0
    end
  end
end
