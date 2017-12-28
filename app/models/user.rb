class User < ApplicationRecord

  validates_presence_of :name

  has_many :comments, dependent: :destroy 

  # 多對多關聯
  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # 一個user，可以有多筆追蹤紀錄（有很多追蹤紀錄在followships table）
  has_many :followships, dependent: :destroy
  # 一個user，可以透過followships table得知正在追蹤的其他users(followings)
  has_many :followings, through: :followships

  # 一個user，可以有很多筆被追蹤的紀錄(很多筆被追蹤的紀錄在followships table)
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  #一個user，可以透過followships table得到有哪些user正在追蹤自己(follower)
  has_many :followers, through: :inverse_followships, source: :user 

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
