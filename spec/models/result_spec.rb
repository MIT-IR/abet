require "rails_helper"

describe Result do
  it "denomarlizes the department from the associated assignment on save" do
    assignment = create(:assignment)
    result = build(:result, assignment: assignment)

    result.save!

    expect(result.department_id).to eq assignment.course_department.id
  end
end
