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

  
  # 一個user，可以有很多提交的交友紀錄（紀錄在friendships table）
  has_many :friendships, dependent: :destroy
  # 一個user，可已透過已提交的多筆交友紀錄，得知有多少user是自己的朋友
  has_many :friends, through: :friendships


  # 一個user，可以有很多筆被加為好友的交友紀錄（紀錄在friendships table）
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  # 一個user，可以透過多筆被加為好友的交友紀錄，得知哪些user向自己提出交友(all_friends)
  has_many :added_friends, through: :inverse_friendships, source: :user


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

  def friend?(user)
    self.friends.include?(user)
  end


  def all_friends
    @mix_friends = self.friends.all + self.added_friends.all
    @mix_friends = @mix_friends.uniq
  end



end
