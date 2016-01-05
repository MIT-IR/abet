class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.
        joins(result: :department).
        where(departments: { slug: user.department_slugs }).
        order(created_at: :desc)
    end
  end
end
