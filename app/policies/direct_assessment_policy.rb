class DirectAssessmentPolicy < ApplicationPolicy
  def create?
    GenericPolicy.new(user, record).create_assessments?
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
