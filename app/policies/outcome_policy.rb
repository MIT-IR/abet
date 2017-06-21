class OutcomePolicy < ApplicationPolicy
  def show?
    user.read?(record.department)
  end

  def create?
    user.admin?(record.department)
  end

  def update?
    user.admin?(record.department)
  end

  def create_assignments?
    user.manage_assignments?(record.department)
  end
end
