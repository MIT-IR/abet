require 'rails_helper'

describe SubjectImporter do
  it "adds new subjects in supplied department" do
    SubjectImporter.new(term: "2017FA", department: 16).run

    subject = Subject.find_by(number: "16.36")

    expect(Subject.count).to eq 1
    expect(subject.title).to eq "Communication Sys & Networks"
    expect(subject.department_number).to eq 16
  end

  it "updates the title of previously existing subjects" do
    subject = create(:subject, number: "16.36", title: "Foo", department_number: 16)

    SubjectImporter.new(term: "2017FA", department: 16).run

    expect(subject.reload.title).to eq "Communication Sys & Networks"
  end
end
