class StandardOutcomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(:name)
    end
  end
end
