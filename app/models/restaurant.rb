class Restaurant < ApplicationRecord
  # 建立表單驗證
  validates_presence_of :name
  # uploader photo
  mount_uploader :image, PhotoUploader
end
