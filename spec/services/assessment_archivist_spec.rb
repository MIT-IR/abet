require "rails_helper"

describe AssessmentArchivist do
  describe "#archive" do
    it "archives the assessment and increments the counter on outcomes" do
      direct_assessment = create(:direct_assessment)
      outcome = direct_assessment.outcomes.first

      AssessmentArchivist.archive(direct_assessment)

      expect(direct_assessment.reload).to be_archived
      expect(outcome.reload.archived_assessments_count).to eq 1
    end
  end

  describe "#unarchive" do
    it "unarchives the assessment and decrements the counter on outcomes" do
      direct_assessment = create(:direct_assessment)
      outcome = direct_assessment.outcomes.first
      outcome.increment!(:archived_assessments_count)

      AssessmentArchivist.unarchive(direct_assessment)

      expect(direct_assessment.reload).not_to be_archived
      expect(outcome.reload.archived_assessments_count).to eq 0
    end

    it "does not make the counter negative" do
      direct_assessment = create(:direct_assessment)
      outcome = direct_assessment.outcomes.first

      AssessmentArchivist.unarchive(direct_assessment)

      expect(direct_assessment.reload).not_to be_archived
      expect(outcome.reload.archived_assessments_count).to eq 0
    end
  end
end
