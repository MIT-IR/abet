require "rails_helper"

describe Course do
  describe ".with_outcomes" do
    it "finds courses that have outcomes" do
      course = create(:outcome).course
      create(:course)

      expect(Course.with_outcomes).to eq [course]
    end
  end

  describe ".without_outcomes" do
    it "finds courses that do not have outcomes" do
      course = create(:course)
      create(:outcome)

      expect(Course.without_outcomes).to eq [course]
    end
  end

  describe "#adopt_default_outcomes!" do
    it "sets has_custom_outcomes to false" do
      course = create(:course, has_custom_outcomes: true)

      course.adopt_default_outcomes!

      expect(course).not_to have_custom_outcomes
    end

    it "Adopts all standard outcomes" do
      course = create(:course)
      standard_outcomes = double("Standard Outcomes")
      allow(StandardOutcome).to receive(:all).and_return(standard_outcomes)
      allow(Adoption).to receive(:process)

      course.adopt_default_outcomes!

      expect(Adoption).to have_received(:process).
        with(standard_outcomes, course: course)
    end
  end
end
