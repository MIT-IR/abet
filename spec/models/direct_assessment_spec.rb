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
    it "archives via the service object" do
      assessment = DirectAssessment.new
      allow(AssessmentArchivist).to receive(:archive)

      assessment.archive

      expect(AssessmentArchivist).to have_received(:archive).with(assessment)
    end
  end

  describe "#unarchive" do
    it "unarchives via the service object" do
      assessment = DirectAssessment.new
      allow(AssessmentArchivist).to receive(:unarchive)

      assessment.unarchive

      expect(AssessmentArchivist).to have_received(:unarchive).with(assessment)
    end
  end
end
