class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  private

  def current_user
    if eppn.present?
      @current_user ||= User.where(email: eppn).first_or_create!
    else
      raise "Expect all requests to have eppn available"
    end
  end

  def eppn
    request.env["eppn"] || ENV["eppn"]
  end
end
