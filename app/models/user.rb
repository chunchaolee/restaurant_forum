class User < ApplicationRecord

  validates_presence_of :name

  has_many :comments, dependent: :destroy 

  # 多對多關聯
  has_many :restaurants, through: :comments

  mount_uploader :avatar, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # define admin? method for authenticate_admin method in application_controller.rb
  def admin?
    self.role == "admin"
  end

end
