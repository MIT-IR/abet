class ResultPolicy < ApplicationPolicy
  def create?
    user.manage_results?(record.assignment.subject_department)
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
