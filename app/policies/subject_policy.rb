class SubjectPolicy < ApplicationPolicy
  def show?
    user.read?(record.department)
  end

  def manage_assignments?
    user.manage_assignments?(record.department)
  end

  class Scope < Scope
    def resolve
      Subject.where(department_number: user.departments.pluck(:number))
    end
  end
end
