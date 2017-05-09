class Activity < PaperTrail::Version
  default_scope { where(item_type: "Result") }

  belongs_to :user, foreign_key: :whodunnit
  belongs_to :result, foreign_key: :item_id

  delegate :username, to: :user, allow_nil: true

  def date
    created_at.to_date
  end

  def subject
    result.assessment.subject.to_s
  end

  def time_formatted
    created_at.strftime("%-I:%M %p")
  end

  private

  def read_only?
    true
  end
end
