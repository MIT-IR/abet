module ControllerAuthHelpers
  def sign_in(user = "daries@mit.edu")
    if user.respond_to?(:email)
      request.env["eppn"] = user.email
    else
      request.env["eppn"] = user
    end
  end
end

RSpec.configure do |config|
  config.include ControllerAuthHelpers, type: :controller
end
