class Resume < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user
  belongs_to :job
  validates :description, presence: true


end
