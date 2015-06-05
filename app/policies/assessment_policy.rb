class AssessmentPolicy < ApplicationPolicy
  def create?
    user.admin?(record.department)
  end

  def update?
    create?
  end
end
