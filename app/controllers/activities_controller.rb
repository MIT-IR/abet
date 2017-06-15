class ActivitiesController < ApplicationController
  def index
    activities = policy_scope(Activity.includes(:user, :item).limit(100))
    @activity_feed = ActivityFeed.new(activities)
  end
end
