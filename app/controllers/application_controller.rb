class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    if eppn.present?
      @current_user ||= User.first_or_create!(email: eppn)
    else
      raise "Expect all requests to have eppn available"
    end
  end

  def eppn
    request.env["eppn"] || ENV["eppn"]
  end
end
