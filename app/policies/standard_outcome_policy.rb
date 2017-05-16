class StandardOutcomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(:label)
    end
  end
end
