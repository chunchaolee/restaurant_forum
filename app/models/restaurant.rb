class Restaurant < ApplicationRecord

  belongs_to :category
  # 建立表單驗證
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  # uploader photo
  mount_uploader :image, PhotoUploader
end
