module ControllerAuthHelpers
  def sign_in(user = "daries@mit.edu")
    unless user.respond_to?(:email)
      user = User.new(email: user)
    end

    request.env["eppn"] = user.email
    user
  end
end

RSpec.configure do |config|
  config.include ControllerAuthHelpers, type: :controller
end
