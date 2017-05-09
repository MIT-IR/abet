require "rails_helper"

describe OutcomeWithMetadata do
  describe "#active_assessments_count" do
    it "is the number of associated active assessments" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment, archived: false)
      outcome.direct_assessments << create(:direct_assessment, archived: true)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_assessments_count).to eq 1
    end
  end

  describe "#active_assessments_with_results_count" do
    it "is the number of active assessments with results recorded" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment, archived: false)
      outcome.direct_assessments << create(:direct_assessment, archived: true)
      active_assessment = outcome.direct_assessments.first
      inactive_assessment = outcome.direct_assessments.last
      active_assessment.results << create(:result, assessment: active_assessment)
      inactive_assessment.results << create(:result, assessment: inactive_assessment)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_assessments_with_results_count).
        to eq 1
    end
  end
end
