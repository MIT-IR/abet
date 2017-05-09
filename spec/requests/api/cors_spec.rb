require "rails_helper"

describe "API CORS headers" do
  it "allows cross origin get requests" do
    subject = create(:subject)
    origin = "https://mit.edu"

    get api_subject_outcomes_path(subject.number), headers: { origin: origin }

    expect(response).to be_ok
    expect(response.headers["Access-Control-Allow-Origin"]).to eq origin
    expect(response.headers["Access-Control-Allow-Methods"]).to eq "GET"
  end
end
