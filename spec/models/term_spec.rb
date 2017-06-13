require_relative "../../app/models/term"
require "time"

describe Term do
  it "is JA of the current year if it is January" do
    time = Time.parse("2017-01-30")

    term = Term.new(time)

    expect(term.to_s).to eq "2017JA"
  end

  it "is SP of the current year if between February and May" do
    time = Time.parse("2017-05-27")

    term = Term.new(time)

    expect(term.to_s).to eq "2017SP"
  end

  it "is SU of the current year if between June and August" do
    time = Time.parse("2017-08-31")

    term = Term.new(time)

    expect(term.to_s).to eq "2017SU"
  end

  it "is FA of the next year if between September and December" do
    time = Time.parse("2017-11-30")

    term = Term.new(time)

    expect(term.to_s).to eq "2018FA"
  end
end
