class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: [:index]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def user_not_authorized
    render file: "public/401.html", status: :unauthorized
  end
end
