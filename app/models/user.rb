class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # define admin? method for authenticate_admin method in application_controller.rb
  def admin?
    self.role == "admin"
  end

end
