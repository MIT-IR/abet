class CoursePolicy < ApplicationPolicy
  def show?
    user.permissions.read?(record.department)
  end

  def create_outcomes?
    user.permissions.admin?(record.department)
  end
end
