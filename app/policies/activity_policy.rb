class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.
        where(department_id: user.departments.pluck(:id)).
        order(created_at: :desc)
    end
  end
end
