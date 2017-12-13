class RestaurantsController < ApplicationController

  # 認證 > ApplicationController

  def index
    @categories = Category.all
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

end
