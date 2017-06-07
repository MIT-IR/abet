class AttachmentPolicy < ApplicationPolicy
  def show?
    user.manage_assessments?(record.course_department)
  end
end
