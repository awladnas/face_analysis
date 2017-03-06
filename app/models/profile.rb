class Profile < ApplicationRecord

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  mount_uploader :attachment_2, AttachmentUploader

end
