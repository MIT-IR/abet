require "rails_helper"

describe Outcome do
  context "counter cache" do
    it "counts the number of direct and indirect assessments" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment)
      outcome.indirect_assessments << create(:survey)

      expect(outcome.assessments_count).to eq 2
    end

    it "decreases when assessments are removed" do
      outcome = create(:outcome)
      direct_assessment = create(:direct_assessment)
      outcome.direct_assessments << direct_assessment
      direct_assessment.destroy

      expect(outcome.reload.assessments_count).to eq 0
    end
  end

  describe "#active_assessments_count" do
    it "is assessments_count - archived_assessments_count" do
      outcome = Outcome.new(assessments_count: 5, archived_assessments_count: 3)

      expect(outcome.active_assessments_count).to eq 2
    end
  end
end
