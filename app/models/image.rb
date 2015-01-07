class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar  ## Add this
  
  validates_presence_of :avatar
  
end
