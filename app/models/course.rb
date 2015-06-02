class Course < ActiveRecord::Base
  belongs_to :department
  has_many :outcomes

  def has_custom_outcomes?
    self.has_custom_outcomes
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
