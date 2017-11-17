class Admin::RestaurantsController < ApplicationController

  # Devise user model 內建認證authenticate_user! 方法
  before_action :authenticate_user!
  # 需要自己撰寫的 authenticate_admin方法，寫在superclass中 /app/controllers/application_controller.rb
  before_action :authenticate_admin

  # 各action method
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_url, :notice => "CREATE NOTICE: 成功建立！"
    else
      render :action => :new
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end


end
