class Adoption
  def self.process(adoptable_outcomes, course:)
    new(adoptable_outcomes, course: course).process
  end

  def initialize(adoptable_outcomes, course:)
    @adoptable_outcomes = Array.wrap(adoptable_outcomes)
    @course = course
  end

  def process
    ApplicationRecord.transaction do
      adoptable_outcomes.each do |adoptable_outcome|
        outcome = course.outcomes.build(
          nickname: adoptable_outcome.nickname,
          label: adoptable_outcome.label,
          description: adoptable_outcome.description
        )

        outcome.alignments.build(
          level: Alignment::HIGH,
          standard_outcome_id: adoptable_outcome.id
        )

        outcome.save!
      end
    end
  end

  private

  attr_reader :adoptable_outcomes, :course
end
