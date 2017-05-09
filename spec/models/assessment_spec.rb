require "rails_helper"

describe Assessment do
  describe "validations" do
    it { should validate_presence_of(:subject) }
  end

  describe ".unarchived" do
    it "returns only unarchived assessments" do
      assessment = create(:assessment, archived: false)
      create(:assessment, archived: true)

      expect(Assessment.unarchived).to eq [assessment]
    end
  end

  describe "#department" do
    it "should return the department of the first associated outcome" do
      assessment = create(:assessment)
      outcome = assessment.outcomes.first

      expect(assessment.department).to eq outcome.department
    end
  end

  describe "#archive" do
    it "sets the archived flag and saves" do
      assessment = create(:assessment)

      assessment.archive

      expect(assessment.reload).to be_archived
    end
  end

  describe "#unarchive" do
    it "unsets the archived flag and saves" do
      assessment = create(:assessment)

      assessment.unarchive

      expect(assessment.reload).not_to be_archived
    end
  end
end
