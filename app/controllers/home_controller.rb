class HomeController < ApplicationController
  before_action :ensure_user_can_access
  before_action :redirect_to_sole_department

  def index
    @departments = authorized_departments
  end

  private

  def ensure_user_can_access
    if authorized_departments.empty?
      render file: "public/401.html", status: :unauthorized
    end
  end

  def redirect_to_sole_department
    if authorized_departments.size == 1
      redirect_to department_path(authorized_departments.first)
    end
  end

  def authorized_departments
    @authorized_departments ||= Department.
      where(role_department: authorized_department_slugs)
  end

  def authorized_department_slugs
    Permission.for(current_user.username).map do |permission|
      permission.department_slug
    end
  end
end
