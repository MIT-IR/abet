require "rails_helper"

describe DirectAssessment do
  describe "validations" do
    it { should validate_presence_of(:subject) }
  end

  describe ".unarchived" do
    it "returns only unarchived direct assessments" do
      assessment = create(:direct_assessment, archived: false)
      create(:direct_assessment, archived: true)

      expect(DirectAssessment.unarchived).to eq [assessment]
    end
  end

  describe "#department" do
    it "should return the department of the first associated outcome" do
      assessment = create(:direct_assessment)
      outcome = assessment.outcomes.first

      expect(assessment.department).to eq outcome.department
    end
  end

  describe "#archive" do
    it "sets the archived flag and saves" do
      assessment = create(:direct_assessment)

      assessment.archive

      expect(assessment.reload).to be_archived
    end
  end

  describe "#unarchive" do
    it "unsets the archived flag and saves" do
      assessment = create(:direct_assessment)

      assessment.unarchive

      expect(assessment.reload).not_to be_archived
    end
  end
end
