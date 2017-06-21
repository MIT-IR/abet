class AssignmentPolicy < ApplicationPolicy
  def create?
    user.manage_assignments?(record.coverage.course.department)
  end

  def edit?
    create?
  end

  def update?
    edit?
  end

  def create_results?
    ResultPolicy.new(user, Result.new(assignment: record)).create?
  end
end
