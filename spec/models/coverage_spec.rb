require "rails_helper"

describe Coverage do
  it "validates subject is unique per course" do
    course = create(:course)
    outcome = create(:outcome, course: course)
    create(:coverage, course: course, outcomes: [outcome])
    coverage = Coverage.new

    expect(coverage).to validate_uniqueness_of(:subject_id).scoped_to(:course_id, :archived)
  end
end
