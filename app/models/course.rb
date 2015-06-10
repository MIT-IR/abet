class Course < ActiveRecord::Base
  belongs_to :department
  has_many :outcomes

  def self.with_custom_outcomes
    where(has_custom_outcomes: true)
  end

  def adopt_default_outcomes!
    update_attribute(:has_custom_outcomes, false)
    defaults = StandardOutcome.retrieve_defaults || []
    defaults.each do |outcome|
      Outcome.create(name: outcome.name,
        description: outcome.description,
        course: self, standard_outcome_id: outcome.id)
    end
  end

  def adopt_custom_outcomes!
    update_attribute(:has_custom_outcomes, true)
  end
end
