class DirectAssessmentPolicy < ApplicationPolicy
  def new?
    GenericPolicy.new(user, record).create_assessments?
  end

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
