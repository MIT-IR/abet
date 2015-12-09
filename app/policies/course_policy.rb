class CoursePolicy < ApplicationPolicy
  def show?
    user.read?(record.department)
  end

  def create_outcomes?
    user.admin?(record.department)
  end

  def manage_assessments?
    user.manage_assessments?(record.department)
  end

  class Scope < Scope
    def resolve
      Course.
        order(:id).
        joins(:department).
        where(departments: { slug: user.department_slugs })
    end
  end
end
