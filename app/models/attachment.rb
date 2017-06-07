class Attachment < ActiveRecord::Base
  EXPIRE_TIMEFRAME = 60.seconds

  belongs_to :attachable, polymorphic: true

  has_attached_file :file,
    url: "/attachments/:id",
    path: ":attachments_root/:attachable_type/:attachable_id/:id/:filename",
    s3_permissions: :private

  validates_attachment_content_type :file, content_type: /\Aapplication\/pdf\z/

  def name
    file_file_name
  end

  def expiring_url
    file.expiring_url(Time.now + EXPIRE_TIMEFRAME)
  end

  def course_department
    attachable.course_department
  end

  def subject_department
    attachable.subject_department
  end
end
