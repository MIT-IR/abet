class AssessmentPolicy < ApplicationPolicy
  def new?
    GenericPolicy.new(user, record).create_assessments?
  end

  def create?
    user.manage_assessments?(record.department)
  end

  def update?
    create?
  end

  def show?
    user.read?(record.department)
  end

  def create_results?
    user.manage_results?(record.department)
  end

  class Scope < Scope
    def resolve
      Course.
        order(:id).
        joins(:department).
        where(
          departments: {
            slug: user.department_slugs(Permission::MANAGE_ASSESSMENTS)
          }
        )
    end
  end
end
