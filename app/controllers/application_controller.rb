class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||=
      User.first_or_create!(email: request.env["eppn"] || ENV["eppn"])
  end
end
