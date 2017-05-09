require "rails_helper"

describe AssessmentReport do
  describe ".for" do
    it "finds assessment report results for the provided course" do
      result = create(:result)
      create(:result)

      reports = AssessmentReport.for(result.assessment.courses.first)

      expect(reports.length). to eq 1
      expect(reports.first.assessment_name).to eq result.assessment.name
    end
  end
end
