class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :file,
    url: "/attachments/:id",
    path: ":attachments_root/:attachable_type/:attachable_id/:id/:filename",
    s3_permissions: :private

  validates_attachment_content_type :file, content_type: /\Aapplication\/pdf\z/

  def name
    file_file_name
  end
end
