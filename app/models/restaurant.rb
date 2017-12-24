class Restaurant < ApplicationRecord

  belongs_to :category
  has_many :comments, dependent: :destroy 

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  # 建立表單驗證
  validates_presence_of :name, :tel, :address, :opening_hours, :description
  # uploader photo
  mount_uploader :image, PhotoUploader

  # is_favorited? instance method
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  # is_liked? instance method
  def is_liked?(user)
    self.liked_users.include?(user)
  end

end
