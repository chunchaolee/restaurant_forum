class Admin::RestaurantsController < ApplicationController

  # Devise user model 內建認證authenticate_user! 方法
  before_action :authenticate_user!
  # 需要自己撰寫的 authenticate_admin方法，寫在superclass中 /app/controllers/application_controller.rb
  before_action :authenticate_admin
  before_action :set_restaurant, :only => [:show, :edit, :update, :destroy]

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

  def show
    # set_restaurant
  end

  def edit
    # set_restaurant
  end

  def update
    # set_restaurant
    if @restaurant.update_attributes(restaurant_params)
      redirect_to admin_restaurant_url, :notice => "UPDATE NOTICE: 更新成功！"
    else
      render :action => :edit, :notice => "UPDATE NOTICE: 更新失敗！"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_url, :notice => "DESTROY NOTICE: 刪除成功！"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end


end
