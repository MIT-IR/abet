class ActivityFeed
  def initialize(activities)
    @activities = activities
  end

  def grouped_activities
    @_days = activities.group_by(&:date)
  end

  private

  attr_reader :activities
end
