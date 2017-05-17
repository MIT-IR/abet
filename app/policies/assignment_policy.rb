class AssignmentPolicy < ApplicationPolicy
  def new?
    GenericPolicy.new(user, record).create_assessments?
  end

  def create?
    user.manage_assessments?(record.department)
  end
end
