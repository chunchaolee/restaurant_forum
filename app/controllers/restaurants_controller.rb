class RestaurantsController < ApplicationController

  # 認證 > ApplicationController

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
