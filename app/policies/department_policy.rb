class DepartmentPolicy < ApplicationPolicy
  def show?
    user.read?(record)
  end

  class Scope < Scope
    def resolve
      scope.where(slug: user.department_slugs).order(:name)
    end
  end
end
