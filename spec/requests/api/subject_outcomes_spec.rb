require "rails_helper"

describe "subject outcomes api" do
  it "returns a unique list of outcomes for the given subject" do
    subject = create(:subject, number: "1.234")
    outcome,_ = create_pair(:outcome)
    assessment = create_pair :direct_assessment,
      subject: subject,
      outcomes: [outcome]

    get api_subject_outcomes_path(subject.number)

    expect(response).to be_ok
    expect(parsed_response.size).to eq 1
    expect(parsed_response.first["name"]).to eq outcome.name
    expect(parsed_response.first["description"]).to eq outcome.description
  end

  def parsed_response
    @parsed_response ||= JSON.parse(response.body)
  end
end
