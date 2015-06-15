require "rails_helper"

describe Adoption do
  it "creates highly aligned outcomes associated to the course" do
    standard_outcome = create(:standard_outcome)
    course = create(:course)

    Adoption.process(standard_outcome, course: course)
    alignment = Alignment.find_by(
      standard_outcome_id: standard_outcome.id,
      level: Alignment::HIGH
    )

    expect(course.outcomes.size).to eq 1
    expect(course.outcomes.first.to_s).to eq standard_outcome.to_s
    expect(alignment).to be_present
  end
end
