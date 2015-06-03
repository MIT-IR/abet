class DepartmentPolicy < ApplicationPolicy
  def show?
    user.permissions.read?(record)
  end

  class Scope < Scope
    def resolve
      scope.where(slug: permissions.department_slugs).order(:name)
    end
  end
end
