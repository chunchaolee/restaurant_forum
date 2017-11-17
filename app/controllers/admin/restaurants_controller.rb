class Admin::RestaurantsController < ApplicationController

  # Devise user model 內建認證authenticate_user! 方法
  before_action :authenticate_user!
  # 需要自己撰寫的 authenticate_admin方法，寫在superclass中 /app/controllers/application_controller.rb
  before_action :authenticate_admin

  # 各action method
  def index
    @restaurants = Restaurant.all
  end



end
