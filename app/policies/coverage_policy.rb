class CoveragePolicy < ApplicationPolicy
  def create?
    user.manage_assignments?(record.course.department)
  end

  def edit?
    create?
  end

  def update?
    create?
  end
end
