class User < ActiveRecord::Base
  validates :email, presence: true, email: true

  delegate :admin?, :read?, :department_slugs, to: :permissions

  def username
    email.split("@").first
  end

  def permissions
    @permissions ||= PermissionSet.for(username)
  end

  def departments
    Department.where(slug: department_slugs)
  end
end
