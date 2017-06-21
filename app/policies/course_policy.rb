class CoursePolicy < ApplicationPolicy
  def show?
    user.read?(record.department)
  end

  def create_outcomes?
    user.admin?(record.department)
  end

  def manage_assignments?
    user.manage_assignments?(record.department)
  end

  class Scope < Scope
    def resolve
      scope.
        order(:id).
        joins(:department).
        where(departments: { slug: user.department_slugs })
    end
  end
end
