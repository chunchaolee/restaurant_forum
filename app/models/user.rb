class User < ApplicationRecord

  validates_presence_of :name

  has_many :comments, dependent: :destroy 

  # 多對多關聯
  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # 一個user，可以追蹤很多人（有很多追蹤紀錄followships）
  has_many :followships, dependent: :destroy
  # 一個user，可以有很多正在追蹤的人(followings)
  has_many :followings, through: :followships

  mount_uploader :avatar, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # define admin? method for authenticate_admin method in application_controller.rb
  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

end
