require "rails_helper"

describe AssignmentReport do
  describe ".for" do
    it "finds assessment report results for the provided course" do
      result = create(:result)
      create(:result)

      reports = AssignmentReport.for(result.assignment.course)

      expect(reports.length). to eq 1
      expect(reports.first.assignment_name).to eq result.assignment_name
    end
  end
end
