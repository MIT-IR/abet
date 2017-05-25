class Attachment < ActiveRecord::Base
  belongs_to :coverage

  has_attached_file :file,
    url: "/attachments/:id",
    path: ":attachments_root/coverage/:coverage_id/:id/:filename",
    s3_permissions: :private

  validates_attachment_content_type :file, content_type: /\Aapplication\/pdf\z/
end
