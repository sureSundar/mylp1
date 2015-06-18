class Region < ActiveRecord::Base
  belongs_to :image
  belongs_to :payoff
  mount_uploader :original, AvatarUploader
  mount_uploader :watermark, AvatarUploader
end
