class OutcomeCoveragePolicy < ApplicationPolicy
  def destroy?
    user.manage_assignments?(record.coverage.course.department)
  end
end
