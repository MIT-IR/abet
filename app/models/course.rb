class Course < ActiveRecord::Base
  belongs_to :department
  has_many :outcomes

  def self.with_custom_outcomes
    where(has_custom_outcomes: true)
  end

  def adopt_default_outcomes!
    self.class.transaction do
      update_column(:has_custom_outcomes, false)

      StandardOutcome.all.each do |standard_outcome|
        outcomes.create!(
          name: standard_outcome.name,
          description: standard_outcome.description,
          standard_outcome_id: standard_outcome.id
        )
      end
    end
  end

  def adopt_custom_outcomes!
    update_column(:has_custom_outcomes, true)
  end
end
