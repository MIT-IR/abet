Paperclip.interpolates :attachments_root do |attachment, style|
  if attachment.options[:storage] == :filesystem
    "public/attachments"
  else
    "attachments"
  end
end

Paperclip.interpolates :attachable_id do |attachment, style|
  attachment.instance.attachable.id
end

Paperclip.interpolates :attachable_type do |attachment, style|
  attachment.instance.attachable.model_name.singular
end

Paperclip.interpolates :course do |attachment, style|
  "course-#{attachment.instance.attachable.course_id}"
end

if Rails.env.production? || Rails.env.staging?
  Paperclip::Attachment.default_options.update({
    storage: :s3,
    s3_region: Rails.application.secrets.s3_region!,
    s3_credentials: {
      bucket: Rails.application.secrets.s3_bucket!,
      access_key_id: Rails.application.secrets.s3_access_key!,
      secret_access_key: Rails.application.secrets.s3_secret!,
    },
  })
end
