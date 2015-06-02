class User < ActiveRecord::Base
  validates :email, presence: true, email: true

  def username
    email.split("@").first
  end
end
