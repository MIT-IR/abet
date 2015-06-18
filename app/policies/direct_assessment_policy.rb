class DirectAssessmentPolicy < ApplicationPolicy
  def new?
    GenericPolicy.new(user, record).create_assessments?
  end

  def create?
    user.manage_assessments?(record.department)
  end

  def update?
    create?
  end

  def show?
    user.read?(record.department)
  end
end
