class AttachmentPolicy < ApplicationPolicy
  def show?
    user.manage_assignments?(record.course_department)
  end
end
