class IndirectAssessmentPolicy < ApplicationPolicy
  def create?
    user.admin?(record.department)
  end

  def update?
    create?
  end

  def show?
    user.read?(record.department)
  end
end
