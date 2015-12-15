require "rails_helper"

describe OutcomeWithMetadata do
  describe "#active_direct_assessments_count" do
    it "is the number of associated active direct assessments" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment, archived: false)
      outcome.direct_assessments << create(:direct_assessment, archived: true)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_direct_assessments_count).to eq 1
    end
  end

  describe "#active_indirect_assessments_count" do
    it "is the number of associated active indirect assessments" do
      outcome = create(:outcome)
      outcome.indirect_assessments << create(:survey, archived: false)
      outcome.indirect_assessments << create(:survey, archived: true)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_indirect_assessments_count).to eq 1
    end
  end

  describe "#active_assessments_count" do
    it "sums active direct and indirect assessment counts" do
      outcome = OutcomeWithMetadata.new(
        active_direct_assessments_count: 1,
        active_indirect_assessments_count: 2,
      )

      expect(outcome.active_assessments_count).to eq 3
    end
  end

  describe "#active_direct_assessments_with_results_count" do
    it "is the number of active direct assessments with results recorded" do
      outcome = create(:outcome)
      outcome.direct_assessments << create(:direct_assessment, archived: false)
      outcome.direct_assessments << create(:direct_assessment, archived: true)
      active_assessment = outcome.direct_assessments.first
      inactive_assessment = outcome.direct_assessments.last
      active_assessment.results << create(:result, assessment: active_assessment)
      inactive_assessment.results << create(:result, assessment: inactive_assessment)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_direct_assessments_with_results_count).
        to eq 1
    end
  end

  describe "#active_indirect_assessments_with_results_count" do
    it "is the number of active indirect assessments with results recorded" do
      outcome = create(:outcome)
      outcome.indirect_assessments << create(:participation, archived: false)
      outcome.indirect_assessments << create(:participation, archived: true)
      active_assessment = outcome.indirect_assessments.first
      inactive_assessment = outcome.indirect_assessments.last
      active_assessment.results << create(:result, assessment: active_assessment)
      inactive_assessment.results << create(:result, assessment: inactive_assessment)

      outcome_with_metadata = OutcomeWithMetadata.find(outcome.id)

      expect(outcome_with_metadata.active_indirect_assessments_with_results_count).
        to eq 1
    end
  end

  describe "#active_assessments_with_results_count" do
    it "sums active direct and indirect assessment with result counts" do
      outcome = OutcomeWithMetadata.new(
        active_direct_assessments_with_results_count: 1,
        active_indirect_assessments_with_results_count: 2,
      )

      expect(outcome.active_assessments_with_results_count).to eq 3
    end
  end
end
