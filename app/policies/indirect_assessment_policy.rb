class IndirectAssessmentPolicy < ApplicationPolicy
  def create?
    user.manage_assessments?(record.department)
  end

  def update?
    create?
  end

  def show?
    user.read?(record.department)
  end

  def create_results?
    user.manage_results?(record.department)
  end
end
