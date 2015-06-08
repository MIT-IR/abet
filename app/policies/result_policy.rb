class ResultPolicy < ApplicationPolicy
  def create?
    user.admin?(record.department)
  end
end
