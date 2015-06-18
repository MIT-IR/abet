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

  def create_assessments?
    user.manage_assessments?(record.department)
  end
end
