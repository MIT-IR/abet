class AssessmentPolicy < ApplicationPolicy
  def create?
    user.permissions.admin?(record.outcome.course.department)
  end

  def update?
    create?
  end
end
