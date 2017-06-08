class AssignmentPolicy < ApplicationPolicy
  def create?
    user.manage_assessments?(record.coverage.course.department)
  end

  def create_results?
    ResultPolicy.new(user, Result.new(assignment: record)).create?
  end
end
