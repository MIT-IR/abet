class ResultPolicy < ApplicationPolicy
  def create?
    user.manage_results?(record.assessment.department)
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
