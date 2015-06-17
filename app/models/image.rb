class Image < ActiveRecord::Base
  belongs_to :project
  has_many :regions
  mount_uploader :original, AvatarUploader
  mount_uploader :final, AvatarUploader
end
