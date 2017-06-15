class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true

  delegate :username, to: :user, allow_nil: true

  def date
    created_at.to_date
  end

  def time_formatted
    created_at.strftime("%-I:%M %p")
  end

  private

  def read_only?
    true
  end
end
