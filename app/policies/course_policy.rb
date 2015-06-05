class CoursePolicy < ApplicationPolicy
  def show?
    user.read?(record.department)
  end

  def create_outcomes?
    user.admin?(record.department)
  end
end
