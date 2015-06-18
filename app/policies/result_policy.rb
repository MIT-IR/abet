class ResultPolicy < ApplicationPolicy
  def create?
    user.manage_results?(record.department)
  end
end
