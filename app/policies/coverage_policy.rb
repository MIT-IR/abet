class CoveragePolicy < ApplicationPolicy
  def create?
    user.manage_assessments?(record.course.department)
  end
end
