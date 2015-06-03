class CoursePolicy < ApplicationPolicy
  def show?
    user.permissions.read?(record.department)
  end
end
