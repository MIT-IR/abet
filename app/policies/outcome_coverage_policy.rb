class OutcomeCoveragePolicy < ApplicationPolicy
  def destroy?
    user.manage_assessments?(record.coverage.course.department)
  end
end
