class AttachmentPolicy < ApplicationPolicy
  def show?
    user.manage_assignments?(record.course_department)
  end

  def destroy?
    show?
  end 
end
