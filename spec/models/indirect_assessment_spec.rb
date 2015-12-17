require "rails_helper"

describe IndirectAssessment do
  describe "#department" do
    it "should return the department of the first associated outcome" do
      assessment = create(:survey)
      outcome = assessment.outcomes.first

      expect(assessment.department).to eq outcome.department
    end
  end

  describe "#archive" do
    it "sets the archived flag and saves" do
      assessment = create(:survey)

      assessment.archive

      expect(assessment.reload).to be_archived
    end
  end

  describe "#unarchive" do
    it "unsets the archived flag and saves" do
      assessment = create(:other_assessment)

      assessment.unarchive

      expect(assessment.reload).not_to be_archived
    end
  end
end
