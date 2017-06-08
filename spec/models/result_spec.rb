require "rails_helper"

describe Result do
  it "denomarlizes the department from the associated assessment on save" do
    assignment = create(:assignment)
    result = build(:result, assignment: assignment)

    result.save!

    expect(result.department_id).to eq assignment.course_department.id
  end

  describe "#name" do
    it "combines the assessment name and description from the result" do
      result = Result.new(
        assessment_name: "name",
        assessment_description: "description",
      )

      expect(result.name).to eq "name - description"
    end
  end
end
