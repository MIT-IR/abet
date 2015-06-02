# Allows tests to sign in a user by passing the user or it's cas_id in the
# `as` parameters.
#   example:
#     visit campaign_path(as: campaign.user)
class TouchstoneBackDoor
  def initialize(app)
    @app = app
  end

  def call(env)
    if Rails.env.test?
      sign_in_through_the_back_door(env)
    end

    @app.call(env)
  end

  private

  def sign_in_through_the_back_door(env)
    params = Rack::Utils.parse_query(env["QUERY_STRING"])
    user_id = params["as"]

    if user_id.present?
      user = User.find(user_id)
      env["eppn"] = user.email
    end
  end
end
