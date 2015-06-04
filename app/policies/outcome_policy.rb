class OutcomePolicy < ApplicationPolicy
  def show?
    user.permissions.read?(record.course.department)
  end

  def create?
    user.permissions.admin?(record.course.department)
  end

  def create_assessments?
    create?
  end
end
