class RestaurantsController < ApplicationController

  # 認證
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
